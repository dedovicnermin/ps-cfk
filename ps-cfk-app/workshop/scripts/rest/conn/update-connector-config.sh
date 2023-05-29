#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
NAME=$3
CONFIG=$4


curl -s -k -X PUT \
  --user nermin:nermin-secret \
  -H "Content-Type: application/json" \
  --data @"$CONFIG" \
  https://connect."$NAMESPACE"."$SITE".confluentps.io/connectors/"$NAME"/config
