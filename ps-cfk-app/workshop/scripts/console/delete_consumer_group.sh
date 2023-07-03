#!/usr/bin/env bash
#

ENV=$1
SITE=$2
GROUP=$3


kafka-consumer-groups --bootstrap-server bootstrap."$ENV"."$SITE".confluentps.io:9092 --command-config sasl_ssl.properties --delete --group "$GROUP"

#oracdc-akv001-1-ORCLPDB1-C##MYUSER-REGIONS
