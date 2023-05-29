#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
LOGGER=$3

curl -s -k -X PUT \
    --user nermin:nermin-secret \
    https://connect.$NAMESPACE.$SITE.confluentps.io/admin/loggers/$LOGGER \
    -H "Content-Type: application/json" \
    -d '{"level": "DEBUG"}'