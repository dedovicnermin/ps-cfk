# $1    = schema id
# resp  = schema (string) belonging to this id
# 
# Option: ?subject=<someSubjectName> 
#       : looks at all contexts and returns schema for the subject you've provided along with id from context


curl -s -k https://sr.kafka.nermdev.io/schemas/ids/$1 --user nermin:nermin-secret

