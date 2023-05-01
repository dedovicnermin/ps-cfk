#!/usr/bin/env bash

NAMESPACE=$1
SITE=$2
USERNAME=$3
PASSWORD=$4


ksql https://ksql.$NAMESPACE.$SITE.confluentps.io --user $USERNAME --password $PASSWORD --config-file ksql.properties
