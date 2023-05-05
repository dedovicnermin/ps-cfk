# Update the mode for a specified subject. 
# ?force=true

curl localhost:8081 \
  -X PUT \
  -H "Content-Type: application/json" \
  --date "{'mode': \'$1 \'}"
