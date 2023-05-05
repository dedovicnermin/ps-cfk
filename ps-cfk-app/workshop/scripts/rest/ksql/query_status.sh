#!/usr/bin/env bash

env=$1
site=$2

curl -k -s https://ksql."$env"."$site".confluentps.io/status --user nermin:nermin-secret | jq .
