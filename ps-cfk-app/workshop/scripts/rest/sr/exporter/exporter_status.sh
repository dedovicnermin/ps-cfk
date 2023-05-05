#!/usr/bin/env bash
echo '=== NAMESPACE: CONFLUENT ==='
curl -s -k https://sr.kafka.nermdev.io/exporters/$1/status --user nermin:nermin-secret | jq
echo '=== FINISHED: CONFLUENT  ==='
echo
echo
echo '=== NAMESPACE: DR ==='
curl -s -k https://sr.dr.kafka.nermdev.io/exporters/$1/status --user nermin:nermin-secret | jq
echo '=== FINISHED: DR  ==='
echo
echo
echo
#./rest/sr/exporter/exporter_status.sh se001