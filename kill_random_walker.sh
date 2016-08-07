#!bin/bash

# kill the deployment, the image name should probably be passed
appName="random_walker"

if [ "$#" -eq 0 ]
then
    read -p "Deploy type [local/aws/all]: "\
         deploy_type
    echo "kill $deploy_type deployment"
else
    for arg in "$@"
    do
        case $arg in
            "--local" )
                deploy_type="local";;
            "--eb" )
                deploy_type="eb";;
            "--all" )
                deploy_type="all";;
        esac
    done
fi


if [ "$deploy_type" = "local" ]
then
    docker-compose stop
    docker-compose rm -f
elif [ "$deploy_type" = "eb" ]
then
    eb terminate $envName
elif [ "$deploy_type" = "all" ]
then
    docker-compose stop
    docker-compose rm -f
    eb terminate $envName
else
    echo "Inappropriate deployment type, must be 'local', 'eb' or 'all'"
fi

unset envName
