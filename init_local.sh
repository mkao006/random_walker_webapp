## The script can only be executed as root
if [ ! `whoami` = root ];
then
    echo "Please execute this script as root!"
    exit
fi

## Set command line color
RED='\033[0;31m'
NC='\033[0m'

echo "Downloading configurations ..."
aws s3 cp --recursive s3://random-walker-config/.ebextensions/ .ebextensions/
aws s3 cp --recursive s3://random-walker-config/.elasticbeanstalk/ .elasticbeanstalk/

## Check if Docker configuration exist
if [ ! -f ~/.docker/config.json ];
then
    echo "${RED}Please create Docker configuration with 'sudo docker login'${NC}"
else
    ## Message to remind the user having the right Docker configuration

    echo "${RED}NOTE: Make sure if you have the right Docker configuration ${NC}"
fi
