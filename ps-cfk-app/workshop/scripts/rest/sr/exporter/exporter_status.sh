#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
NAME=$3


echo '=== NAMESPACE: $NAMESPACE ==='
curl -s -k https://sr.$NAMESPACE.$SITE.confluentps.io/exporters/$NAME/status --user nermin:nermin-secret | jq
echo '=== FINISHED: CONFLUENT  ==='
echo
echo
echo '=== NAMESPACE: DR ==='
curl -s -k https://sr.$NAMESPACE.$SITE.confluentps.io/exporters/$NAME/status --user nermin:nermin-secret | jq
echo '=== FINISHED: DR  ==='
echo
echo
echo
#./rest/sr/exporter/exporter_status.sh se001