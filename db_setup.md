# Set up AWS RDS

The database need to be configured one-off in order for the application to work,
then the application can the restore previous version of the snapshot by
executing the `deploy_aws.sh`.

## Steps

1. Create an RDS instance.

```
aws rds create-db-instance\
    --region ap-southeast-1\
    --engine postgres\
    --engine-version 9.3.14\
    --db-instance-class db.t2.micro\
    --allocated-storage 5\
    --no-multi-az\
    --db-instance-identifier DB_IDENTIFIER\
    --db-name DB_NAME\
    --master-username DB_USER\
    --master-user-password DB_PASSWORD\
    --port 5432
```

We have make the database publicly available so we can connect to the database
and then run the configuration.

2. Allow connection to the VPC

Log into the AWS console then change the inbound traffic to allow `PostgreSQL`
inbound traffic for the VPC. If security group is assigned to the RDS, then
modify the security group to allow inbound traffic.

3. Connect to the database

We can connect to the database by running the following in ther terminal.

```
psql --username DB_USER --host DB_ENDPOINT --port 5432 --password --dbname DB_NAME
```

The `DB_ENDPOINT` can be obtained by log into the AWS console then identified
under the details of the DB instance created.

4. Create the extension

Execute the following code provided in the [AWS
documentation](http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.PostgreSQL.CommonDBATasks.html#Appendix.PostgreSQL.CommonDBATasks.PostGIS)

```

    CREATE EXTENSION IF NOT EXISTS postgis;
    CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;
    CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder;
    CREATE EXTENSION IF NOT EXISTS postgis_topology;

    ALTER SCHEMA tiger OWNER TO rds_superuser;
    ALTER SCHEMA topology OWNER TO rds_superuser;

    CREATE FUNCTION exec(text) returns text language plpgsql volatile AS $f$ BEGIN EXECUTE $1; RETURN $1; END; $f$;

    SELECT exec('ALTER TABLE ' || quote_ident(s.nspname) || '.' || quote_ident(s.relname) || ' OWNER TO rds_superuser;')
      FROM (
        SELECT nspname, relname
          FROM pg_class c JOIN pg_namespace n ON (c.relnamespace = n.oid)
          WHERE nspname in ('tiger','topology') AND
          relkind IN ('r','S','v') ORDER BY relkind = 'S')
    s;
```

After this step, the database should be configured for the Random Walker
application.

5. Terminate the instance

Delete the instance and save a snapshot

```
aws rds delete-db-instance\
    --db-instance-identifier random-walker\
    --final-db-snapshot-identifier random-walker-db-final-snapshot\
    --region ap-southeast-1
```