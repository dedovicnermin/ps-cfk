# Get the subject-version pairs identified by the input ID
# $1 == schemaID

curl localhost:8081/schemas/ids/$1/versions
