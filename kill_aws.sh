#!bin/bash

# kill the deployment, the image name should probably be passed
appName="random_walker"

## Take snapshot of the database
aws rds delete-db-snapshot\
    --db-snapshot-identifier random-walker-db-final-snapshot\
    --region ap-southeast-1

## Kill the database
aws rds delete-db-instance\
    --db-instance-identifier random-walker\
    --final-db-snapshot-identifier random-walker-db-final-snapshot\
    --region ap-southeast-1

## Terimnate the application
eb terminate $envName
unset envName
