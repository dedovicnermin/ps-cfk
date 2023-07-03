resource "confluent_service_account" "connector-producer" {
  display_name = "${var.environment_display_name}-connector-producer"
  description  = "Connector service account that can produce to all topics in cluster."
}

resource "confluent_api_key" "connector-producer-kafka-api-key" {
  display_name = "connector-producer-kafka-api-key"
  description  = "Kafka API Key that is owned by 'connector-producer' service account"
  owner {
    id          = confluent_service_account.connector-producer.id
    api_version = confluent_service_account.connector-producer.api_version
    kind        = confluent_service_account.connector-producer.kind
  }

  managed_resource {
    id          = var.cluster_id
    api_version = var.cluster_api_version
    kind        = var.cluster_kind

    environment {
      id = var.environment_id
    }
  }
}

resource "confluent_kafka_acl" "connector-producer-describe-on-cluster" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "CLUSTER"
  resource_name = "kafka-cluster"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.connector-producer.id}"
  host          = "*"
  operation     = "DESCRIBE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "connector-producer-write-on-topics" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "*"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.connector-producer.id}"
  host          = "*"
  operation     = "WRITE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "connector-producer-create-jdbc" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "jdbc"
  pattern_type  = "PREFIXED"
  principal     = "User:${confluent_service_account.connector-producer.id}"
  host          = "*"
  operation     = "CREATE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}
