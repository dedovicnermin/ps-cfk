# update global SR mode. 

# Params:
#   ?force=true - force a mode change even if the SR has existing schemas. 
#               - this can be useful in DR scenarios using schema linking. 


curl -X PUT \
  -H "Content-Type: application/json" \
  localhost:8081/mode \
  --data '{"mode": "READONLY"}'

