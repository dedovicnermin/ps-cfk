resource "confluent_service_account" "connector-debezium" {
  display_name = "${var.environment_display_name}-connector-debezium"
  description  = "Connector service account only for debezium connector."
}

resource "confluent_api_key" "connector-debezium-kafka-api-key" {
  display_name = "connector-debezium-kafka-api-key"
  description  = "Kafka API Key that is owned by 'connector-debezium' service account"
  owner {
    id          = confluent_service_account.connector-debezium.id
    api_version = confluent_service_account.connector-debezium.api_version
    kind        = confluent_service_account.connector-debezium.kind
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

resource "confluent_kafka_acl" "connector-debezium-describe-on-cluster" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "CLUSTER"
  resource_name = "kafka-cluster"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.connector-debezium.id}"
  host          = "*"
  operation     = "DESCRIBE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "connector-debezium-read-on-cluster" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "CLUSTER"
  resource_name = "kafka-cluster"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.connector-debezium.id}"
  host          = "*"
  operation     = "READ"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "connector-debezium-describe-configs-on-cluster" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_name = "kafka-cluster"
  resource_type = "CLUSTER"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.connector-debezium.id}"
  host          = "*"
  operation     = "DESCRIBE_CONFIGS"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "connector-debezium-create-on-cluster" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "CLUSTER"
  resource_name = "kafka-cluster"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.connector-debezium.id}"
  host          = "*"
  operation     = "CREATE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}


resource "confluent_kafka_acl" "connector-debezium-write-on-cluster" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "CLUSTER"
  resource_name = "kafka-cluster"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.connector-debezium.id}"
  host          = "*"
  operation     = "WRITE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}


resource "confluent_kafka_acl" "connector-debezium-describe-configs-on-topics" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "*"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.connector-debezium.id}"
  host          = "*"
  operation     = "DESCRIBE_CONFIGS"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}


resource "confluent_kafka_acl" "connector-debezium-describe-on-topics" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "*"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.connector-debezium.id}"
  host          = "*"
  operation     = "DESCRIBE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}


resource "confluent_kafka_acl" "connector-debezium-write-on-topics" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "*"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.connector-debezium.id}"
  host          = "*"
  operation     = "WRITE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}


resource "confluent_kafka_acl" "connector-debezium-create-on-topics" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "*"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.connector-debezium.id}"
  host          = "*"
  operation     = "CREATE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "connector-debezium-read-on-topics" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "*"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.connector-debezium.id}"
  host          = "*"
  operation     = "READ"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "connector-debezium-read-on-group" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "GROUP"
  resource_name = "*"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.connector-debezium.id}"
  host          = "*"
  operation     = "READ"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}