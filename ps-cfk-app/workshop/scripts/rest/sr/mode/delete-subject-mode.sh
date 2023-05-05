# Deletes the subject level mode for the specified subj. and 
# reverts back to global default

SUBJ=$1

curl localhost:8081/mode/$SUBJ \
  -X DELETE 
