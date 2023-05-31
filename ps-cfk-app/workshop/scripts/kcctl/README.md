https://github.com/kcctl/kcctl


```
kcctl config set-coantext --cluster=https://connect.dev.gke.confluentps.io pscfk-dev --offset-topic dev.connect-offsets --bootstrap-servers bootstrap.dev.gke.confluentps.io:9092 --client-config-file /Users/ndedovic/IdeaaProjects/ps-cfk/ps-cfk-app/workshop/nermin/sasl_ssl.properties
```

### .kcctl

```json
{
  "currentContext" : "pscfk-dev",
  "pscfk-dev" : {
    "cluster" : "https://nermin:nermin-secret@connect.dev.gke.confluentps.io",
    "bootstrapServers" : "bootstrap.dev.gke.confluentps.io:9092",
    "username": "nermin",
    "password": "nermin-secret",
    "offsetTopic" : "dev.connect-offsets",
    "clientConfig" : {
      "security.protocol" : "SASL_SSL",
      "ssl.truststore.location" : "/Users/ndedovic/IdeaProjects/ps-cfk/ps-cfk-app/workshop/nermin/truststore.jks",
      "sasl.mechanism" : "PLAIN",
      "sasl.jaas.config" : "org.apache.kafka.common.security.plain.PlainLoginModule required username=\"nermin\" password=\"nermin-secret\";",
      "ssl.truststore.password" : "mystorepassword",
      "client.id" : "console.nermin"
    }
  }
}
```


# alias to bypass cert validation

```

source /Users/ndedovic/IdeaProjects/ps-cfk/ps-cfk-app/workshop/scripts/kcctl/kcctl_completion.sh
alias kcctl="kcctl -Djavax.net.ssl.trustStore=/Users/ndedovic/IdeaProjects/ps-cfk/ps-cfk-app/workshop/nermin/truststore.jks -Djavax.net.ssl.trustStorePassword=mystorepassword"

```


## describe connector config

```
kcctl describe plugin io.confluent.connect.oracle.cdc.OracleCdcSourceConnector
```


```
kcctl get connectors
kcctl describe connector protobuf.stock_trades
kcctl describe connector protobuf.stock_trades --tasks.config
kcctl patch connector protobuf.stock_trades --set tasks.max=2
```