#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
SUBJ=$3



curl -s -k --user nermin:nermin-secret \
  -X DELETE \
  https://sr."$NAMESPACE"."$SITE".confluentps.io/subjects/$SUBJ
