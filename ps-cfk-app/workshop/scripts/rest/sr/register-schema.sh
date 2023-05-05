# Register a new schema under the specified subject.
# Essentially, create a new schema.
# If success, returns unique ID of schema in the registry.
# If the same schema is registered under a different subject, the same identifier will be returned.
# However, the version of the schema may be different under diff subjects.
# If multiple SR instances in same cluster, request is forwarded to primary. Else, (primary down) fails.


SUBJECT=$1
SCHEMA_FILE=$2

curl -X POST \
  -H 'Content-Type: application/vnd.schemaregistry.v1+json' \
  localhost:8081/subjects/$SUBJECT/versions \
  --data "@${SCHEMA}"
