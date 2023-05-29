#!/usr/bin/env bash


NAMESPACE=$1
SITE=$2
CONFIG=$3


curl -s -k --user nermin:nermin-secret -X POST -H "Content-Type: application/json" "https://connect.$NAMESPACE.$SITE.confluentps.io/connectors" --data @"$CONFIG" | jq