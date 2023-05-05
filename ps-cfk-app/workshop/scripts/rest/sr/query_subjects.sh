#!/usr/bin/env bash

env=$1
site=$2

curl -k -s https://sr."$env"."$site".confluentps.io/subjects --user nermin:nermin-secret | jq .
