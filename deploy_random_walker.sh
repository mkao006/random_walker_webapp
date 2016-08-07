#!bin/bash

# We will deploy the docker to local here.
# -----------------------------------------------------------------------

## NOTE (Michael): Change the prompt to arguement.

# Initialisation
rootDir=$(pwd)
dockerRepo="mkao006"
appName="random_walker"
awsConfigDir="$rootDir/config/aws/"
export envName="random-walker"


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

if [ "$deploy_type" = "local" ]
then
    docker-compose stop
    docker-compose build
    docker-compose up -d
elif [ "$deploy_type" = "eb" ]
then
    eb create $envName -i t2.micro --single
    eb console
fi

# Check the deployment instances. Should only have one instance running? Maybe
# this file should be different on different branch in order to allow for
# different instances.

# Maybe we can have the same script accross different branches, but the script
# reads the branch to determine the deployment.


# Copy the configuration file for each type of deployment

# Build each deployment

# Export the type of deployment as ENV variable

