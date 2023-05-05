#!/usr/bin/env bash

env=$1

export NAMESPACE=$env
for conn in $(kubectl -n "$NAMESPACE" get connector --no-headers \
-o jsonpath='{.items[*].metadata.name}'); do \
./operator/connector/reconcile_connector.sh "$conn"; done