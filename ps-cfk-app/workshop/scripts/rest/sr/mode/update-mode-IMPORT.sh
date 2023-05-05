# update global SR mode. 

# Params:
#   ?force=true - force a mode change even if the SR has existing schemas. 
#               - this can be useful in DR scenarios using schema linking. 

PORT=$1

if [ -z "$PORT" ];
then
  PORT=8081;
fi


curl -s -X PUT \
  -H "Content-Type: application/json" \
  localhost:"$PORT"/mode \
  --data '{"mode": "IMPORT"}'

