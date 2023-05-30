## Credit to kafka-docker-playground

Infra setup could not have been done without [kafka-docker-playground](https://github.com/vdesabou/kafka-docker-playground/tree/master/connect/connect-cdc-oracle19-source)
A best attempt at converting from docker-based deployment to k8-based deployment.


## Deploying
1. cd `ps-cfk-infra/bases/00_external/oracle19c`
2. `kustomize build . | kubectl apply -f -`





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
