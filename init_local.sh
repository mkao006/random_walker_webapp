## The script can only be executed as root
if [ ! `whoami` = root ];
then
    echo "Please execute this script as root!"
    exit
fi

## Set command line color
RED='\033[0;31m'
NC='\033[0m'

echo "Making directories ... "
mkdir -p .ebextensions
mkdir -p random_walker/settings/credentials/
mkdir -p nginx/conf.d/
mkdir -p postgis/init/

echo "Downloading configurations ..."
aws s3 cp s3://random-walker-config/.ebextensions/read_config.config .ebextensions/
aws s3 cp s3://random-walker-config/.ebextensions/securelistener.config .ebextensions/
aws s3 cp s3://random-walker-config/random_walker/settings/credentials/settings.json random_walker/settings/credentials/
aws s3 cp s3://random-walker-config/nginx/conf.d/random_walker.conf nginx/conf.d/
aws s3 cp s3://random-walker-config/postgis/init/random_walker_db.sh postgis/init/

## Check if EB CLI has been configured.
if [ ! -d ".elasticbeanstalk" ];
then
    echo "${RED}Please configure your EB CLI command line with 'eb configure'${NC}"
fi

## Check if Docker configuration exist
if [ ! -f ~/.docker/config.json ];
then
    echo "${RED}Please create Docker configuration with 'sudo docker login'${NC}"
else
    ## Message to remind the user having the right Docker configuration

    echo "${RED}NOTE: Make sure if you have the right Docker configuration ${NC}"
fi
