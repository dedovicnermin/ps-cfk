# Deletes a specific version of the schema registered under this subject.
# Unless you perform a hard delete, this only deletes the version,
# leaving the schema ID intact and making it still possible to decode 
# data using the schema ID. 
# This API is recomm. to be used only in dev or under extreme circumstances
# where-in, its required to delete a prev. registered schema for compatibility
# purposes or re-register prev. registered schema.

SUBJ=$1
VERS=$2

curl -X DELETE \
    localhost:8081/subjects/$SUBJ/versions/$VERS

