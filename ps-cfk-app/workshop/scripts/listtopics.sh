#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2

kafka-topics --bootstrap-server bootstrap.$NAMESPACE.gke.confluentps.io:9092 --command-config sasl_ssl.properties --list
