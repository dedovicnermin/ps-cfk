#!/usr/bin/env bash


# ./bump_replication_factor dev gke test "0,1,2"

ENV=$1
NAMESPACE=$2
TOPIC=$3
REPLICAS=$4



cat << EOF > /tmp/pscfk_bump_rf.json
{
  "version": 1,
  "partitions": [
    {
      "topic": "$TOPIC",
      "partition": 0,
      "replicas": [0,1,2]
    }
  ]
}
EOF

kafka-reassign-partitions --command-config sasl_ssl.properties --bootstrap-server bootstrap.$ENV.$NAMESPACE.confluentps.io:9092 --reassignment-json-file /tmp/pscfk_bump_rf.json --execute