# Random Walker Web App Setup

The following configurations are required for the Random Walker web application.

## Managinng secrets

All application which will be deployed to AWS should be set up with
[*git secret*](https://github.com/awslabs/git-secrets)

When making commits and merges, the hook will scan for any potential
security breach such as password.

## Docker

Docker is an open-source project that automates the deployment of applications
inside software containers.

### Installation

```
sudo apt-get update && sudo apt-get install docker-engine
```

```
pip install docker-compose
```

Install the docker machine
```
curl -L https://github.com/docker/machine/releases/download/v0.7.0-rc3/docker-machine-`uname -s`-`uname -m` >/usr/local/bin/docker-machine && \
  chmod +x /usr/local/bin/docker-machine
```

If you have the [permissiong or curl
problem](https://forums.docker.com/t/permission-denied-when-trying-to-install-compose-on-ubuntu/1034/5),
then run the following.

```
sudo bash -c "curl -L https://github.com/docker/machine/releases/download/v0.7.0-rc3/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && chmod +x /usr/local/bin/docker-machine"
```

** IMPORTANT NOTE: The Docker must be installed before the EB command line
   interface, as EB depends on Docker. If EB CLI is installed first, you might
   risk that the Docker version installed is unsupported by EB and result in
   error.**

## AWS and EB CLI

AWS and EB CLI (Command Line Interface) are command line tools which are used to
interact with AWS.

### Installation
```
pip install awscli
pip install awsebcli
```

After installing the AWS command line tool, enter `aws configure` to set up the
AWS credentials.

Then change directory to the root of the project and then enter `eb init` to
start configuring the project.

### EB configurations

The EB configurations (`.elasticbeanstalk` and `.ebextensions`) are stored on
the private `random-walker-config` bucket on S3.

They can be updated with

```
aws s3 cp <local_config_location> <s3_location>
```

and retrieved with

```
aws s3 cp <s3_location> <local_config_location>
```