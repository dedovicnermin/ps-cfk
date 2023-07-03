#!/usr/bin/env bash

APIKEY=$1
APISECRET=$2
SR_APIKEY=$3
SR_APISECRET=$4


confluent kafka client-config create java \
  --api-key "$APIKEY" \
  --api-secret "$APISECRET" \
  --schema-registry-api-key "$SR_APIKEY" \
  --schema-registry-api-secret "$SR_APISECRET" > ccloud.properties


#confluent kafka client-config create java --api-key ZAKE35POAFYPQMWP --api-secret IIMxTtLGA9/b+pYlOQ6YOCs0BYwdjO1Hifj0Miu9QTsL0faT1XeRJTFO4IRQsR+l --schema-registry-api-key RJAYUR5UOB6I3RJF --schema-registry-api-secret Up0EvcF0PstaYSGgoC2mZChHdPh1Lv+YAlf43LSBkle5G7fJ/gvDSRM8JdQE496H
