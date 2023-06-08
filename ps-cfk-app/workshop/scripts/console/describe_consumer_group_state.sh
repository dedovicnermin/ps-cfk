#!/usr/bin/env bash

env=$1
site=$2
group=$3

kafka-consumer-groups --bootstrap-server bootstrap."$env"."$site".confluentps.io:9092 --command-config sasl_ssl.properties --group "$group" --describe --state

