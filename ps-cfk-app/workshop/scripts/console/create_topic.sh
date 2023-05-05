#!/usr/bin/env bash
env=$1
site=$2
topic=$3

kafka-topics --bootstrap-server bootstrap."$env"."$site".confluentps.io:9092 \
  --command-config sasl_ssl.properties \
  --create --topic "$topic" \
  --partitions 1 --replication-factor 2
