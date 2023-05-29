#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
# Deletes a specific version of the schema registered under this subject.
# Unless you perform a hard delete, this only deletes the version,
# leaving the schema ID intact and making it still possible to decode 
# data using the schema ID. 
# This API is recomm. to be used only in dev or under extreme circumstances
# where-in, its required to delete a prev. registered schema for compatibility
# purposes or re-register prev. registered schema.

SUBJ=$3
VERS=$4

curl -s -k --user nermin:nermin-secret \
  -X DELETE \
  https://sr."$NAMESPACE"."$SITE".confluentps.io/subjects/$SUBJ/versions/$VERS

