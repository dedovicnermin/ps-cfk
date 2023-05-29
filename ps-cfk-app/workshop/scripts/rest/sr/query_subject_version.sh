#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
SUBJ=$3
VERS=$4

curl -k -s \
  https://sr."$NAMESPACE"."$SITE".confluentps.io/subjects/$SUBJ/versions/$VERS --user nermin:nermin-secret | jq .
