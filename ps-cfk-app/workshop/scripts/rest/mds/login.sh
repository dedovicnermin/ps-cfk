#!/usr/bin/env bash

env=$1
site=$2

confluent login --url https://mds."$env"."$site".confluentps.io:443 --ca-cert-path pem/cacert.pem --save
