#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
# $1    = schema id
# resp  = schema (string) belonging to this id
# 
# Option: ?subject=<someSubjectName> 
#       : looks at all contexts and returns schema for the subject you've provided along with id from context
ID=$3

curl -s -k \
  https://sr."$NAMESPACE"."$SITE".confluentps.io/schemas/ids/$ID --user nermin:nermin-secret | jq

