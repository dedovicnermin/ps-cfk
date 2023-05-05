#!/usr/bin/env bash

env=$1
site=$2
TOPIC=$3
FORMAT=$4
INTERVAL=$5
NUM_RECORDS=$6
SCHEMA_PATH=$7
KEY=$8

if [ "$#" -eq 0 ]; then
  echo "No arguments provided"
  echo "USAGE: ./../scripts/datagen/interval_customschema.sh dev gke <topic> <JSON | JSON_SCHEMA | AVRO | PROTOBUF> <INTERVAL> <NUM_REC> <cloudevent.avsc> <KEY | id>"
  exit 1

fi


kfk-producer-datagen interval \
  --prop bootstrap.servers=bootstrap."$env"."$site".confluentps.io:9092 \
  --config sasl_ssl.properties \
  --topic "$TOPIC" \
  --format "$FORMAT"  \
  --interval "$INTERVAL" \
  -n "$NUM_RECORDS" \
  --schema="$SCHEMA_PATH" \
  --key="$KEY"




