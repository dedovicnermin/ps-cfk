curl -k -s https://sr.kafka.nermdev.io/subjects/$1/versions/$2 --user nermin:nermin-secret | jq .
