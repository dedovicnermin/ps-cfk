#!/usr/bin/env bash

NS=$1
SITE=$2
TOPIC=$3

kafka-get-offsets --bootstrap-server bootstrap."$NS"."$SITE".confluentps.io:9092 --command-config sasl_ssl.properties --topic "$TOPIC"
