#!/usr/bin/env bash

env=$1
site=$2

confluent cluster describe --url https://mds."$env"."$site".confluentps.io --ca-cert-path pem/cacert.pem
