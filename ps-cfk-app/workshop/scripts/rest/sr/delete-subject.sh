# Deletes the specified subject and its associated compatibility lvl if registered.
# Recomennded to use this API only when a topic needs to be recycled or in dev. env.
# # $1 == subjectName

# Options:
#   : ?permanent=true


curl localhost:8081/subjects/$1
