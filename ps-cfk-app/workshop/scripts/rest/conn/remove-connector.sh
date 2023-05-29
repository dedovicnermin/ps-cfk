#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
NAME=$3 #connector_name


curl -s -k \
  --user nermin:nermin-secret \
  -X DELETE \
  https://sr."$NAMESPACE"."$SITE".confluentps.io/connectors/"$NAME"