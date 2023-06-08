#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
CLUSTER_NAME=$3



confluent cluster register --cluster-name dev_pscfk --kafka-cluster 4GdX5VpNRIG2AAscARgBvg --hosts bootstrap.dev.gke.confluentps.io:9092 --protocol SASL_SSL
confluent cluster register --cluster-name dev_connect --kafka-cluster 4GdX5VpNRIG2AAscARgBvg --connect-cluster dev.connect --protocol HTTPS --hosts connect.dev.gke.confluentps.io:443