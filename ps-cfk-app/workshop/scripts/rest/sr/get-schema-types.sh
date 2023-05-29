#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
# Get the schema types that are requistered with Schema Registry

curl -s -k \
  --user nermin:nermin-secret \
  https://sr."$NAMESPACE"."$SITE".confluentps.io/schemas/types | jq

