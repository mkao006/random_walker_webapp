#!/bin/sh

echo "
     ************************************************************************
     Creating random_walker database ...
     ************************************************************************
     "

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER random_walker WITH SUPERUSER PASSWORD 'walk_randomly';
    CREATE DATABASE random_walker OWNER random_walker;
    CREATE EXTENSION IF NOT EXISTS postgis;
    GRANT ALL PRIVILEGES ON DATABASE random_walker TO random_walker;
EOSQL

psql -d postgres -c "\l"


