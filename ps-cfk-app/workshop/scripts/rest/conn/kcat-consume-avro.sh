#!/usr/bin/env bash


NAMESPACE=$1
SITE=$2
TOPIC=$3

kcat -b "bootstrap.$NAMESPACE.$SITE.confluentps.io:9092" \
    -r "https://sr.$NAMESPACE.$SITE.confluentps.io" \
    -s avro \
    -t "$TOPIC" \
    -C -o -10 -q
    