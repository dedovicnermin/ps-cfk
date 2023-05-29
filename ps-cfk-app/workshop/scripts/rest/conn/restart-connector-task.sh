#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
NAME=$3
TASK_ID=$4

curl \
  -s -k \
  --user nermin:nermin-secret \
  -X POST \
  https://connect."$NAMESPACE"."$SITE".confluentps.io/connectors/"$NAME"/tasks/"$TASK_ID"/restart


