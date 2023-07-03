resource "confluent_service_account" "replicator" {
  display_name = "${var.environment_display_name}-replicator"
  description  = "Replicator service account that can read, write and describe from all topics in cluster."
}

resource "confluent_kafka_acl" "replicator-read-topic" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "*"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.replicator.id}"
  host          = "*"
  operation     = "READ"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "replicator-write-topic" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "*"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.replicator.id}"
  host          = "*"
  operation     = "WRITE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "replicator-describe-topic" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "*"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.replicator.id}"
  host          = "*"
  operation     = "DESCRIBE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "replicator-describe-configs" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "TOPIC"
  resource_name = "*"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.replicator.id}"
  host          = "*"
  operation     = "DESCRIBE_CONFIGS"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}

resource "confluent_kafka_acl" "replicator-describe-on-cluster" {
  kafka_cluster {
    id = var.cluster_id
  }
  resource_type = "CLUSTER"
  resource_name = "kafka-cluster"
  pattern_type  = "LITERAL"
  principal     = "User:${confluent_service_account.replicator.id}"
  host          = "*"
  operation     = "DESCRIBE"
  permission    = "ALLOW"
  rest_endpoint = var.cluster_rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
}
