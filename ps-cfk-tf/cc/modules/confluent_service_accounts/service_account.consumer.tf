resource "confluent_service_account" "connector-consumer" {
  display_name = "${var.environment_display_name}-connector-consumer"
  description  = "Connector service account that can read from all topics in cluster."
}

resource "confluent_api_key" "connector-consumer-kafka-api-key" {
  display_name = "connector-consumer-kafka-api-key"
  description  = "Kafka API Key that is owned by 'connector-consumer' service account"
  owner {
    id          = confluent_service_account.connector-consumer.id
    api_version = confluent_service_account.connector-consumer.api_version
    kind        = confluent_service_account.connector-consumer.kind
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

resource "confluent_kafka_acl" "connector-consumer-describe-on-cluster" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "CLUSTER"
  resource_name = "kafka-cluster"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.connector-consumer.id}"
  host          = "*"
  operation     = "DESCRIBE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "connector-consumer-create-dlq" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "dlq-"
  pattern_type  = "PREFIXED"
  principal     = "User:${confluent_service_account.connector-consumer.id}"
  host          = "*"
  operation     = "CREATE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "connector-consumer-write-dlq" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "dlq-"
  pattern_type  = "PREFIXED"
  principal     = "User:${confluent_service_account.connector-consumer.id}"
  host          = "*"
  operation     = "WRITE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "connector-consumer-create-error" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "error-"
  pattern_type  = "PREFIXED"
  principal     = "User:${confluent_service_account.connector-consumer.id}"
  host          = "*"
  operation     = "CREATE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "connector-consumer-write-error" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "error-"
  pattern_type  = "PREFIXED"
  principal     = "User:${confluent_service_account.connector-consumer.id}"
  host          = "*"
  operation     = "WRITE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "connector-consumer-create-success" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "success-"
  pattern_type  = "PREFIXED"
  principal     = "User:${confluent_service_account.connector-consumer.id}"
  host          = "*"
  operation     = "CREATE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "connector-consumer-write-success" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "success-"
  pattern_type  = "PREFIXED"
  principal     = "User:${confluent_service_account.connector-consumer.id}"
  host          = "*"
  operation     = "WRITE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "connector-consumer-read-on-topics" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "*"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.connector-consumer.id}"
  host          = "*"
  operation     = "READ"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "connector-consumer-read-on-group" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "GROUP"
  resource_name = "connect-"
  pattern_type  = "PREFIXED"
  principal     = "User:${confluent_service_account.connector-consumer.id}"
  host          = "*"
  operation     = "READ"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}
