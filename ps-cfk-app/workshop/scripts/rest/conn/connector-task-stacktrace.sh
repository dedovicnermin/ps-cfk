#!/usr/bin/env bash

env=$1
site=$2
connector=$3



curl -s -k "https://connect.$env.$site.confluentps.io/connectors/$connector/status" --user nermin:nermin-secret | jq '.tasks[0].trace'