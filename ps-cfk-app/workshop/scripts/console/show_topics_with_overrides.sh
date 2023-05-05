#!/usr/bin/env bash

env=$1
site=$2

kafka-topics --bootstrap-server bootstrap."$env"."$site".confluentps.io:9092 --command-config sasl_ssl.properties --describe --topics-with-overrides