#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
SUBJ=$3
MODE=$4

# Update the mode for a specified subject.
# ?force=true

curl https://sr."$NAMESPACE"."$SITE".confluentps.io/subjects/$SUBJ/mode \
  -s -k --user nermin:nermin-secret \
  -X PUT \
  -H "Content-Type: application/json" \
  --date "{'mode': \'$MODE \'}"
