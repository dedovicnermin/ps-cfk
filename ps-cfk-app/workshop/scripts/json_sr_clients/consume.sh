#!/usr/bin/env bash

env=$1
site=$2
topic=$3
group=$4


kafka-json-schema-console-consumer \
  --bootstrap-server bootstrap.servers=bootstrap."$env"."$site".confluentps.io:9092 \
  --topic "$topic"  \
  --property schema.registry.url=https://sr."$env"."$site".confluentps.io \
  --property schema.registry.ssl.truststore.location=truststore.jks \
  --property schema.registry.basic.auth.credentials.source=USER_INFO \
  --property schema.registry.basic.auth.user.info=nermin:nermin-secret \
  --property schema.registry.ssl.truststore.password=mystorepassword \
  --from-beginning \
  --consumer.config sasl_ssl.properties \
  --group "$group" \
  --property auto.offset.reset=earliest


