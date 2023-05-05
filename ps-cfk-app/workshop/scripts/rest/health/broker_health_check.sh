#!/usr/bin/env bash

env=$1

for i in {0..2} ; do
  echo "=== $i ==="
  kubectl -n "$env" exec kafka-"$i" --container kafka -- curl -s localhost:7778/metrics | grep UnderReplicatedPartitions
  echo "=== | ==="
  echo
done

