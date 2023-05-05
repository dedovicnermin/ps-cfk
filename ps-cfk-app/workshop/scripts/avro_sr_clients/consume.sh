env=$1
site=$2
topic=$3
key_serializer=$4

if [ -z $key_serializer ]; then
  kafka-avro-console-consumer \
      --bootstrap-server bootstrap.plain.kafka.nermdev.io:9092 \
      --topic "$topic"  \
      --property schema.registry.url=https://sr.$env.$site.confluentps.io \
      --property schema.registry.ssl.truststore.location=truststore.jks \
      --property schema.registry.basic.auth.credentials.source=USER_INFO \
      --property schema.registry.basic.auth.user.info=nermin:nermin-secret \
      --property schema.registry.ssl.truststore.password=mystorepassword \
      --from-beginning \
      --consumer.config sasl_ssl.properties \
      --property auto.offset.reset=earliest \
      --property print.schema.ids=true \
      --property schema.id.separator=:
else

  kafka-avro-console-consumer \
        --bootstrap-server bootstrap.plain.kafka.nermdev.io:9092 \
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
        --property print.schema.ids=true \
        --property schema.id.separator=: \
        --property key.deserializer=org.apache.kafka.common.serialization.$key_serializer
fi






