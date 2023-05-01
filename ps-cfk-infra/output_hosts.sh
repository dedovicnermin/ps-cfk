#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2

declare -A dns
dns[0]="b0.$NAMESPACE.$SITE.confluentps.io"
dns[1]="b1.$NAMESPACE.$SITE.confluentps.io"
dns[2]="b2.$NAMESPACE.$SITE.confluentps.io"
dns[3]="bootstrap.$NAMESPACE.$SITE.confluentps.io"

i=0
kubectl get services -n "$NAMESPACE" -o json | jq -r '.items[] | .status.loadBalancer?|.ingress[]?|.ip' | while read line; do
  echo "$line ${dns[$i]}"
  let "i+=1"
done


kubectl get services -n ingress-nginx -o json | jq -r '.items[] | .status.loadBalancer?|.ingress[]?|.ip' | while read line; do
    echo "$line ksql.$NAMESPACE.$SITE.confluentps.io"
    echo "$line sr.$NAMESPACE.$SITE.confluentps.io"
    echo "$line connect.$NAMESPACE.$SITE.confluentps.io"
    echo "$line ksql.$NAMESPACE.$SITE.confluentps.io"
    echo "$line krp.$NAMESPACE.$SITE.confluentps.io"
    echo "$line mds.$NAMESPACE.$SITE.confluentps.io"
    echo "$line grafana.confluentps.io"
    echo "$line prometheus.confluentps.io"
    echo "$line c3.$NAMESPACE.$SITE.confluentps.io"
done





