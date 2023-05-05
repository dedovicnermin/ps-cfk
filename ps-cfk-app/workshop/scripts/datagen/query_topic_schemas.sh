#!/usr/bin/env bash

env=$1
site=$2

kfk-producer-datagen topics --config sasl_ssl.properties \
 --pretty \
 --prop bootstrap.servers=bootstrap."$env"."$site".confluentps.io:9092