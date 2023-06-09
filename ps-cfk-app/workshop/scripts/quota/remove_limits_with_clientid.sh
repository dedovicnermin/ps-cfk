#!/usr/bin/env bash

env=$1
site=$2
user=$3
client=$4
config=$5

kafka-configs --bootstrap-server bootstrap."$env"."$site".confluentps.io:9092 --command-config sasl_ssl.properties \
  --alter \
  --delete-config "$config" \
  --entity-type users --entity-name "$user" \
  --entity-type clients --entity-name "$client"
