#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
ID=$3
# Get the subject-version pairs identified by the input ID
# $1 == schemaID

curl -s -k \
  --user nermin:nermin-secret \
  https://sr."$NAMESPACE"."$SITE".confluentps.io/schemas/ids/$ID/versions


