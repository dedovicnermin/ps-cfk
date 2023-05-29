#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
TOPIC=$3
SCHEMA_DEF=$4

curl -s -k \
  --user nermin:nermin-secret \
  -X POST \
 -H "Content-Type: application/vnd.schemaregistry.v1+json" \
 https://sr."$NAMESPACE"."$SITE".confluentps.io/subjects/"$TOPIC"-value/versions --data @"$SCHEMA_DEF" | jq
