#!bin/bash

# kill the deployment, the image name should probably be passed
appName="random_walker"


eb terminate $envName
unset envName
