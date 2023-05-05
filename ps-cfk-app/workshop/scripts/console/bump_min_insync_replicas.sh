#!/usr/bin/env bash

env=$1
site=$2
topic=$3
value=$4

kafka-topics --bootstrap-server bootstrap."$env"."$site".confluentps.io:9092 \
  --command-config sasl_ssl.properties \
  --alter --topic "$topic" \
  --config min.insync.replicas="$value"