#!bin/bash

# kill the deployment, the image name should probably be passed
appName="random_walker"

read -p "Deploy type [local/aws/all]: "\
     deploy_type
echo "kill $deploy_type deployment"

if [ "$deploy_type" = "local" ]
then
    docker-compose stop
elif [ "$deploy_type" = "aws" ]
then
    eb terminate $envName
elif [ "$deploy_type" = "all" ]
then
    docker-compose stop
    eb terminate $envName
fi

unset envName
