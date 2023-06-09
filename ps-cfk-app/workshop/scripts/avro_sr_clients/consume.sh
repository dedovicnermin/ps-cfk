#!/usr/bin/env bash

env=$1
site=$2
topic=$3
key_deserializer=$4

if [ -z $key_deserializer ]; then
  kafka-avro-console-consumer \
      --bootstrap-server bootstrap."$env"."$site".confluentps.io:9092 \
      --topic "$topic"  \
      --property schema.registry.url=https://sr.$env.$site.confluentps.io \
      --property schema.registry.ssl.truststore.location=truststore.jks \
      --property schema.registry.basic.auth.credentials.source=USER_INFO \
      --property schema.registry.basic.auth.user.info=nermin:nermin-secret \
      --property schema.registry.ssl.truststore.password=mystorepassword \
      --from-beginning \
      --consumer.config sasl_ssl.properties \
      --property auto.offset.reset=earliest \
      --property "line.separator=


"
else

  kafka-avro-console-consumer \
        --bootstrap-server bootstrap."$env"."$site".confluentps.io:9092 \
        --topic "$topic"  \
        --property schema.registry.url=https://sr.$env.$site.confluentps.io \
        --property schema.registry.ssl.truststore.location=truststore.jks \
        --property schema.registry.basic.auth.credentials.source=USER_INFO \
        --property schema.registry.basic.auth.user.info=nermin:nermin-secret \
        --property schema.registry.ssl.truststore.password=mystorepassword \
        --from-beginning \
        --consumer.config sasl_ssl.properties \
        --property auto.offset.reset=earliest \
        --property print.key=true \
        --property "print.timestamp=true" \
        --property "key.separator= :: " \
        --property "line.separator=


"


#        --max-messages "$4"

#        --property print.schema.ids=true \
#        --property schema.id.separator=: \
#
fi






