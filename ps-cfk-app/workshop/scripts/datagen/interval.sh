#!/usr/bin/env bash

env=$1
site=$2
TOPIC=$3
FORMAT=$4
INTERVAL=$5
NUM_RECORDS=$6
QUICKSTART=$7

if [ -z $QUICKSTART ]; then
    echo "USAGE: ./../scripts/datagen/interval.sh dev gke kfk.test.001 JSON 10000 400000 STOCK_TRADES"
    echo "CLICKSTREAM_CODES, CLICKSTREAM, CLICKSTREAM_USERS, ORDERS, RATINGS, USERS, USERS_, PAGEVIEWS, STOCK_TRADES, INVENTORY, PRODUCT, PURCHASES, TRANSACTIONS, STORES, CREDIT_CARDS"
    exit 1
fi

kfk-producer-datagen interval \
  --prop bootstrap.servers=bootstrap."$env"."$site".confluentps.io:9092 \
  --config sasl_ssl.properties \
  --topic "$TOPIC" \
  --format "$FORMAT"  \
  --interval "$INTERVAL" \
  -n "$NUM_RECORDS" \
  --quickstart "$QUICKSTART"




