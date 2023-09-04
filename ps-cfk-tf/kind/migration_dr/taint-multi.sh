#!/usr/bin/env bash

kubectl taint nodes playground-worker app=kafka:NoSchedule
kubectl taint nodes playground-worker2 app=kafka:NoSchedule
kubectl taint nodes playground-worker3 app=zookeeper:NoSchedule
kubectl taint nodes playground-worker4 app=zookeeper:NoSchedule
