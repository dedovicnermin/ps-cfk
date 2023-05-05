# Test input schema against a particular version of a subjects schmea for compatibility.
# Note that the compat. lvl applied for the check is configured compat. lvl for the subject,
# i.e. `curl openapi.html:8081/config/$SUBJ`

SUBJ=$1
VERS=$2
SCHEMA=$3

curl -s -k -X POST \
  -H "Content-Type: application/json" \
  --user nermin:nermin-secret \
  https://sr.kafka.nermdev.io/compatibility/subjects/$SUBJ/versions/$VERS \
  --data @"$SCHEMA"

