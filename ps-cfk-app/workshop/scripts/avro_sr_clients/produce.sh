env=$1
site=$2
topic=$3
schema_id=$4


kafka-avro-console-producer \
    --bootstrap-server bootstrap.$env.$site.confluentps.io:9092 --topic "$topic" \
    --property value.schema.id="$schema_id" \
    --producer.config sasl_ssl.properties \
    --property schema.registry.url="https://sr.$env.$site.confluentps.io" \
    --property schema.registry.ssl.truststore.location=truststore.jks \
    --property schema.registry.basic.auth.credentials.source=USER_INFO \
    --property schema.registry.basic.auth.user.info=nermin:nermin-secret \
    --property schema.registry.ssl.truststore.password=mystorepassword \
    --property use.latest.version=true \
    --property latest.compatibility.strict=false \
    --property auto.register.schemas=false \
    --property parse.key=true \
    --property "key.separator= "


