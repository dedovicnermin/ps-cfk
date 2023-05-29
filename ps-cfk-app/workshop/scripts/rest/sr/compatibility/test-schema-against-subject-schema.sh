# Test input schema against a particular version of a subjects schmea for compatibility.
# Note that the compat. lvl applied for the check is configured compat. lvl for the subject,
# i.e. `curl openapi.html:8081/config/$SUBJ`
#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
SUBJ=$3
VERS=$4
SCHEMA=$5

curl -s -k -X POST \
  -H "Content-Type: application/json" \
  --user nermin:nermin-secret \
  https://sr."$NAMESPACE"."$SITE".confluentps.io/compatibility/subjects/"$SUBJ"/versions/"$VERS" \
  --data @"$SCHEMA"

