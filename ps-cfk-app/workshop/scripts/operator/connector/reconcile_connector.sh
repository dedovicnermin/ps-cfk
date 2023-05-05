#!/usr/bin/env bash

kubectl confluent connector reconcile force --name "$1"
