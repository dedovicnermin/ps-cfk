#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
NAME=$3


echo "=== NAMESPACE: $NAMESPACE ==="
curl -s -k https://sr.$NAMESPACE.$SITE.confluentps.io/exporters/$NAME/status --user nermin:nermin-secret | jq
echo "=== FINISHED: $NAMESPACE  ==="
echo
#./rest/sr/exporter/exporter_status.sh se001