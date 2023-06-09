#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2

echo '=== NAMESPACE: CONFLUENT ==='
curl -s -k https://sr.$NAMESPACE.$SITE.confluentps.io/exporters --user nermin:nermin-secret | jq
echo '=== FINISHED: CONFLUENT  ==='
echo
echo
echo '=== NAMESPACE: DR ==='
curl -s -k https://sr.dr.$SITE.confluentps.io/exporters --user nermin:nermin-secret | jq
echo '=== FINISHED: DR  ==='
echo
echo
echo

