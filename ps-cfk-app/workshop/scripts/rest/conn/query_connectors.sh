#!/usr/bin/env bash

env=$1
site=$2

curl -k -s https://connect."$env"."$site".confluentps.io/connectors --user nermin:nermin-secret | jq .

