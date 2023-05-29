#!/usr/bin/env bash

# Nermin Dedovic
# 2022-07-27 
# API-



env=$1
site=$2


FAIL_COUNT=0

# shellcheck disable=SC2046
if [ $(curl -s -k --user nermin:nermin-secret https://connect."$env"."$site".confluentps.io/connectors | jq '. | length') -eq 0 ]
then
  echo "VERIFICATION FAILED\tNO DEPLOYED CONNECTORS FOUND"
  exit 1
fi


for i in $(curl -s localhost:$PORT/connectors | jq -j @tsv) 
do
  CONN_STATE=$(curl -s -k --user nermin:nermin-secret https://connect."$env"."$site".confluentps.io/connectors/$i/status | jq '.connector.state' | grep FAILED | wc -l | sed 's/ //g')
  if [ "$CONN_STATE" != 0 ]
  then
    echo "$i:failed_to_initilize:1"
    let FAIL_COUNT+=$CONN_STATE
  else
    TASKS_FAILED=$(curl -s -k --user nermin:nermin-secret https://connect."$env"."$site".confluentps.io/connectors/$i/status | jq '.tasks[] | {state} | join(" ")' | grep FAILED | wc -l | sed 's/ //g')
    echo $i:task_failed_count:$TASKS_FAILED
    if [ $TASKS_FAILED -gt 0 ]
    then 
      echo "$TASKS_FAILED failed connector tasks present in $i"
      let FAIL_COUNT+=$TASKS_FAILED
    fi
  fi 
done


if [ "$FAIL_COUNT" -gt 0 ]
then
  echo "VERIFICATION FAILED\tFAIL_COUNT = $FAIL_COUNT"
  exit 1
fi


echo "VERIFICATION PASSED"
exit 0
