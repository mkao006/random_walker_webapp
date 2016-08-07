#!bin/bash

# We will deploy the docker to local here.
# -----------------------------------------------------------------------

# Initialisation
rootDir=$(pwd)
dockerRepo="mkao006"
appName="random_walker"
awsConfigDir="$rootDir/config/aws/"
export envName="random-walker"

## Read the type of deployment
if [ "$#" -eq 0 ]
then
    read -p "Deploy type [local/eb]: "\
         deploy_type
    echo "Deploying $deploy_type"
else
    for arg in "$@"
    do
        case $arg in
            "--local" )
                deploy_type="local";;
            "--eb" )
                deploy_type="eb";;
        esac
    done
fi

## Deploy by type
if [ "$deploy_type" = "local" ]
then
    docker-compose stop
    docker-compose build
    docker-compose up -d
elif [ "$deploy_type" = "eb" ]
then
    eb create $envName -i t2.micro --single
    eb console
else
    echo "Inappropriate deployment type, must be 'local' or 'eb'"
fi

