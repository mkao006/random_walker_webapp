#!bin/bash

# kill the deployment, the image name should probably be passed
appName="random_walker"

read -p "Deploy type [local/aws/all]: "\
     deploy_type
echo "Deploying $deploy_type"

if [ "$deploy_type" = "local" ]
then
    docker-compose stop
elif [ "$deploy_type" = "aws" ]
then
    eb terminate
elif [ "$deploy_type" = "all" ]
then
    docker-compose stop
    eb terminate
fi
