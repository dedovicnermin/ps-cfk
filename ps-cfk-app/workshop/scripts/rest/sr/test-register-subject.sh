# Check if a schema has already been registered under the specified subject.
# If so, this returns the schema string along with its globally unique identifier.
# As well as its version under this subject and subject name.

SUBJ=$1

curl localhost:8081/subjects/$SUBJ
