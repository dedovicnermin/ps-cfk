#!/usr/bin/env bash


declare -A dns
dns[0]="pb0.plain.kafka.nermdev.io"
dns[1]="pb1.plain.kafka.nermdev.io"
dns[2]="pb2.plain.kafka.nermdev.io"
dns[3]="bootstrap.plain.kafka.nermdev.io"
#dns[4]="mb0.mtls.kafka.nermdev.io"
#dns[5]="mb1.mtls.kafka.nermdev.io"
#dns[6]="mb2.mtls.kafka.nermdev.io"
#dns[7]="bootstrap.mtls.kafka.nermdev.io"
#dns[8]="c3.kafka.nermdev.io"

i=0
kubectl get services --all-namespaces -o json | jq -r '.items[] | .status.loadBalancer?|.ingress[]?|.ip' | while read line ; do
  echo "$line ${dns[$i]}"
  let "i+=1"
  if [ $i -ge 5 ]; then
    echo "$line ksql.kafka.nermdev.io"
    echo "$line sr.kafka.nermdev.io"
    echo "$line connect.kafka.nermdev.io"
    echo "$line ksql.kafka.nermdev.io"
    echo "$line krp.kafka.nermdev.io"
    echo "$line mds.kafka.nermdev.io"
    echo "$line grafana.nermdev.io"
    echo "$line prometheus.nermdev.io"
    echo "$line c3.kafka.nermdev.io"
    echo "$line kibana.kafka.nermdev.io"
    echo "$line elastic.kafka.nermdev.io"


  fi


done

