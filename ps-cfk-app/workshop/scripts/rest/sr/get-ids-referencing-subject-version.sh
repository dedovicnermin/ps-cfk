# Get a list of IDs of schemas that ref. the schema with the given subject and version

SUBJ=$1
VERS=$2

curl localhost:8081/subjects/$SUBJ/versions/$VERS/referencedby

