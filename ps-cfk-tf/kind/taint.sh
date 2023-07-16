#!/usr/bin/env bash

kubectl taint nodes playground-worker app=kafka:NoSchedule
kubectl taint nodes playground-worker2 app=zookeeper:NoSchedule
