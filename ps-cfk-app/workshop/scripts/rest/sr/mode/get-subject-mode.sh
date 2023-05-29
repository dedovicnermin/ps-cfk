#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
SUBJ=$3


curl -s -k --user nermin:nermin-secret \
  https://sr."$NAMESPACE"."$SITE".confluentps.io/mode/"$SUBJ"
