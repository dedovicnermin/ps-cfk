#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
NAME=$3

curl \
  -s -k \
  --user nermin:nermin-secret \
  -X PUT \
  "https://connect.$NAMESPACE.$SITE.confluentps.io:8083/connectors/$1/pause"


