#!/bin/bash
ssh root@uil0map-paas-app01 "./pull-from-registry.sh $1"
docker pull uil0map-paas-app01.skead.no:5000/$1
docker tag uil0map-paas-app01.skead.no:5000/$1 $1
