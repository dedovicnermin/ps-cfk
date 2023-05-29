#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2

# update global SR mode.

# Params:
#   ?force=true - force a mode change even if the SR has existing schemas. 
#               - this can be useful in DR scenarios using schema linking. 





curl -s -k --user nermin:nermin-secret \
  -X PUT \
  -H "Content-Type: application/json" \
  https://sr."$NAMESPACE"."$SITE".confluentps.io/mode \
  --data '{"mode": "IMPORT"}'

