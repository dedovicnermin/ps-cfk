#!/usr/bin/env bash

env=$1

echo "i=2"

kubectl logs kafka-2 -n "$env"| grep Exception > health.txt
kubectl logs kafka-2 -n "$env"| grep Denied >> health.txt


echo
echo "i=1"
kubectl logs kafka-1 -n "$env"| grep Exception >> health.txt
kubectl logs kafka-1 -n "$env"| grep Denied >> health.txt


echo
echo "i=0"
kubectl logs kafka-0 -n "$env"| grep Exception >> health.txt
kubectl logs kafka-0 -n "$env"| grep Denied >> health.txt




