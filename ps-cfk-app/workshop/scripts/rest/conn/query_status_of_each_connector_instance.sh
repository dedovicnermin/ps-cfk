#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2

connectors=$(sh ./query-connectors.sh "$NAMESPACE" "$SITE" | jq .)
echo "CONNECTOR_LIST = $connectors"


array=$(sh ./query-connectors.sh "$NAMESPACE" "$SITE" | jq -c -r '.[]')
for elem in "${array[@]}"; do
  echo
  resp=$(sh ./query-connector-status.sh "$NAMESPACE" "$SITE" "$elem" | jq)
  echo "$resp"
  echo
done
  
  



#jq -c '.[]' $connectors | while i -n; do
#  curl localhost:8083/connectors/$i/status
# done
