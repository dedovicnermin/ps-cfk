#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2

curl -s -k --user nermin:nermin-secret https://connect.$NAMESPACE.$SITE.confluentps.io:8083/admin/loggers/ | jq