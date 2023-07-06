#!/usr/bin/env bash

env=$1
site=$2
TOPIC=$3
SCHEMA_FORMAT=$4
COUNT=$5
TP=$6
QUICKSTART=$7


kfk-producer-datagen perf \
  --prop bootstrap.servers=bootstrap."$env"."$site".confluentps.io:9092 \
  --config kfk-client.properties \
  --format="$SCHEMA_FORMAT" \
  --throughput "$TP" \
  --num-records "$COUNT" \
  --quickstart "$QUICKSTART" \
  --topic "$TOPIC"


#CLICKSTREAM_CODES
#CLICKSTREAM | CLICKSTREAM_USERS | ORDERS | RATINGS | USERS | USERS_ | PAGEVIEWS | STOCK_TRADES | INVENTORY | PRODUCT | PURCHASES |STORES | CREDIT_CARDS

