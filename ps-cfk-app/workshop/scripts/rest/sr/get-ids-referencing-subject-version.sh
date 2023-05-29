#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
# Get a list of IDs of schemas that ref. the schema with the given subject and version

SUBJ=$3
VERS=$4

curl -s -k --user nermin:nermin-secret \
  https://sr."$NAMESPACE"."$SITE".confluentps.io/subjects/$SUBJ/versions/$VERS/referencedby

