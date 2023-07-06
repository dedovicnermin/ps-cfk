#!/usr/bin/env bash

env=$1
site=$2
rate=$3

kafka-configs --bootstrap-server bootstrap."$env"."$site".confluentps.io:9092 --command-config sasl_ssl.properties \
  --alter \
  --add-config "producer_byte_rate=$rate" \
  --entity-type users --entity-type clients

