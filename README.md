# Random Walker Web app

This is the repository for the deployment of the `Random Walker` application.

[![Stories in
Ready](https://badge.waffle.io/mkao006/random_walker.png?label=ready&title=Ready)](https://waffle.io/mkao006/random_walker_webapp)

## Setup

Several setups are required to deploy the application, for more information
please see [setup.md](setup.md)

## Components

The web application consists of the following components:

### Random Walker

The `Random Walker` application is a Docker image hosted on
[Dockerhub](https://hub.docker.com/r/mkao006/random_walker/).

For more information about the image, please see [Random
Walker](https://github.com/mkao006/random_walker)

### Nginx

The `Nginx` web server uses the official nginx image from
[Dockerhub](https://hub.docker.com/_/nginx/).

## Deployment

### AWS EB (Staging)

If the Elastic Beanstalk is configured with `eb init`, and the file
[`Dockerrun.aws.json`](https://github.com/mkao006/random_walker_webapp/blob/master/Dockerrun.aws.json)
is present; then we can deploy on AWS EB with,

``` sudo sh deploy_aws.sh ```

### Kill application

To kill the application, simply run the following script.

``` sudo sh kill_aws.sh ```