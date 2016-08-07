# Random Walker Web app

This is the repository for the deployment of the `Random Walker` application.

[![Stories in
Ready](https://badge.waffle.io/mkao006/random_walker.png?label=ready&title=Ready)](https://waffle.io/mkao006/random_walker_webapp)

## Configuration

Several setups are required to deploy the application, for more information on
how to configure the setup please see
[configuration.md](https://github.com/mkao006/random_walker_webapp/blob/dev/configuration.md)

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

The [configuration
files](https://github.com/mkao006/random_walker_webapp/blob/master/nginx/conf.d/random_walker.conf)
sits under the **nginx** directory.


### Postgis

We use the `Postgis` image from
[Dockerhub](https://hub.docker.com/r/mdillon/postgis/) which is an extension of
the official [`Postgres` image](https://hub.docker.com/_/postgres/).

The [initialise
script](https://github.com/mkao006/random_walker_webapp/blob/master/postgis/init/random_walker_db.sh)
is under the **postgis** directory.

## Deployment

### Local

Assuming `docker-compose` is installed and that the
[`docker-compose.yml`](https://github.com/mkao006/random_walker_webapp/blob/master/docker-compose.yml)
is correctly specified. We can deploy the application locally with,

``` sudo sh deploy_random_walker.sh --local ```

The application is then hosted on `localhost`.


### AWS EB (Staging)

If the Elastic Beanstalk is configured with `eb init`, and the file
[`Dockerrun.aws.json`](https://github.com/mkao006/random_walker_webapp/blob/master/Dockerrun.aws.json)
is present; then we can deploy on AWS EB with,

``` sudo sh deploy_random_walker.sh --eb ```

### Kill application

To kill the application, substitute one of `local`, `eb` or `all` into the
`<deployment_type>` in the following command.

``` sudo sh kill_random_walker.sh <deployment_type> ```