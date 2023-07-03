#!/usr/bin/env bash
env=$1
site=$2
topic=$3


kafka-console-consumer \
    --bootstrap-server bootstrap."$env"."$site".confluentps.io:9092 \
    --consumer.config sasl_ssl.properties \
    --topic "$topic" \
    --from-beginning \
    --property "print.key=true" \
    --property "print.partition=true" \
    --property "print.headers=false" \
    --property "key.separator=---" \
    --property "print.timestamp=true" \
    --property "line.separator=


"
