#!bin/bash

# We will deploy the docker to local here.
# -----------------------------------------------------------------------
envName="random-walker"

## Restore database
aws rds restore-db-instance-from-db-snapshot \
    --db-instance-identifier random-walker \
    --db-snapshot-identifier random-walker-latest-snapshot\
    --db-instance-class db.t2.micro \
    --port 5432 \
    --no-multi-az\
    --no-publicly-accessible\
    --region ap-southeast-1

## Create application
eb create $envName -i t2.micro
eb console

