
NAMESPACE=$1
SITE=$2

curl -s -k --user nermin:nermin-secret "https://connect.$NAMESPACE.$SITE.confluentps.io/connectors?expand=info&expand=status" | \
jq '. | to_entries[] | [.value.info.type, .key, .value.status.connector.state, .value.status.tasks[].state,.value.info.config."connector.class"] | join(":|:")' | \
column -s : -t | sed 's/\"//g' | sort