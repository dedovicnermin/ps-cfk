#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
NAME=$3

echo "=== NAMESPACE: $NAMESPACE ==="
echo
curl -s -k https://sr."$NAMESPACE"."$SITE".confluentps.io/exporters/"$NAME" --user nermin:nermin-secret | jq
echo
echo "=== FINISHED: $NAMESPACE ==="
echo
echo

