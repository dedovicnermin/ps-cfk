#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
SUBJ=$3

# Deletes the subject level mode for the specified subj. and
# reverts back to global default



curl -s -k --user nermin:nermin-secret \
  -X DELETE \
  https://sr."$NAMESPACE"."$SITE".confluentps.io/mode/"$SUBJ"

