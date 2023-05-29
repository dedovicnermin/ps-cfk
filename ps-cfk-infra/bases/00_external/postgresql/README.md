```
kubectl exec -it [pod-name] --  psql -h localhost -U admin --password -p 5432 postgresdb
postgresdb=# \l

```