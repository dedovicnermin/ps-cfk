#!/usr/bin/env bash

QUICKSTART=$1

if [ -z $QUICKSTART ]; then
    echo "USAGE: ./datagen/sample.sh ORDERS"
    echo "CLICKSTREAM_CODES, CLICKSTREAM, CLICKSTREAM_USERS, ORDERS, RATINGS, USERS, USERS_, PAGEVIEWS, STOCK_TRADES, INVENTORY, PRODUCT, PURCHASES, TRANSACTIONS, STORES, CREDIT_CARDS"
    exit 1
fi

kfk-producer-datagen sample --pretty --print-schema --quickstart "$QUICKSTART"
kfk-producer-datagen sample --pretty --quickstart "$QUICKSTART"
