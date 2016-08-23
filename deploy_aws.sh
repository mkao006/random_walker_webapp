#!bin/bash

# We will deploy the docker to local here.
# -----------------------------------------------------------------------

eb create $envName -i t2.micro
eb console

