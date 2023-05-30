## Credit to kafka-docker-playground

Infra setup could not have been done without [kafka-docker-playground](https://github.com/vdesabou/kafka-docker-playground/tree/master/connect/connect-cdc-oracle19-source)
A best attempt at converting from docker-based deployment

## Purpose

- Standup/configure oracle db to integrate with [Confluent Oracle CDC Source Connector](https://docs.confluent.io/kafka-connectors/oracle-cdc/current/overview.html#oracle-cdc-source-connector-for-cp)
- Getting straight into deploying the connector / avoid setting up DB





## Deploying
1. cd `ps-cfk-infra/bases/00_external/oracle19c`
2. `kustomize build . | kubectl apply -f -`

> NOTE: takes at least 15 minutes to complete after deployment




# Notes

1. kubectl exec -it oracle19-REPLACEME -n oracle -- sh 
```
sqlplus C\#\#MYUSER/mypassword@//localhost:1521/ORCLPDB1
```


```
select table_name from all_tables where owner='C##MYUSER';

TABLE_NAME
--------------------------------------------------------------------------------
CUSTOMERS
REGIONS
COUNTRIES
```
