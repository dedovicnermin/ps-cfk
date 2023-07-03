terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.43.0"
    }
  }
}

provider "confluent" {
  cloud_api_key = var.access_key
  cloud_api_secret = var.secret_key
}

// env-manager service account provides confluent cloud
// API key for use in buildkite terraform process
resource "confluent_service_account" "env-manager" {
  display_name = "${var.environment_display_name}-env-manager"
  description  = "Service account to manage the ${var.environment_display_name} environment"
}

resource "confluent_role_binding" "env-manager-kafka-environment-admin" {
  principal   = "User:${confluent_service_account.env-manager.id}"
  role_name   = "EnvironmentAdmin"
  crn_pattern = var.environment_resource_name
}

resource "confluent_api_key" "env-manager-kafka-api-key" {
  display_name = "env-manager-kafka-api-key"
  description  = "Cloud API Key that is owned by 'env-manager' service account"
  owner {
    id          = confluent_service_account.env-manager.id
    api_version = confluent_service_account.env-manager.api_version
    kind        = confluent_service_account.env-manager.kind
  }

  managed_resource {
    id          = var.cluster_id
    api_version = var.cluster_api_version
    kind        = var.cluster_kind


    environment {
      id = var.environment_id
    }
  }

  depends_on = [
    confluent_role_binding.env-manager-kafka-environment-admin
  ]
}



resource "confluent_api_key" "sr_env_manager_apikey" {
  display_name = "env-manager-sr-api-key"
  description  = "Cloud API Key that is owned by 'env-manager' service account for sr"
  owner {
    id          = confluent_service_account.env-manager.id
    api_version = confluent_service_account.env-manager.api_version
    kind        = confluent_service_account.env-manager.kind
  }

  managed_resource {
    id          = var.sr_cluster_id
    api_version = var.sr_cluster_apiversion
    kind        = var.sr_cluster_kind


    environment {
      id = var.environment_id
    }
  }

  depends_on = [
    confluent_role_binding.env-manager-kafka-environment-admin
  ]
}



// 'app-manager' service account is required to grant ACLs
// to 'connector-producer' and 'connector-consumer' service accounts.
resource "confluent_service_account" "app-manager" {
  display_name = "${var.environment_display_name}-app-manager"
  description  = "Service account to manage 'basic-cluster' Kafka cluster"
}


resource "confluent_role_binding" "app-manager-kafka-cluster-admin" {
  principal   = "User:${confluent_service_account.app-manager.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = var.cluster_rbac_crn
}


resource "confluent_api_key" "app-manager-kafka-api-key" {
  display_name = "app-manager-kafka-api-key"
  description  = "Kafka API Key that is owned by 'app-manager' service account"
  owner {
    id          = confluent_service_account.app-manager.id
    api_version = confluent_service_account.app-manager.api_version
    kind        = confluent_service_account.app-manager.kind
  }

  managed_resource {
    id          = var.cluster_id
    api_version = var.cluster_api_version
    kind        = var.cluster_kind

    environment {
      id = var.environment_id
    }
  }

  depends_on = [
    confluent_role_binding.app-manager-kafka-cluster-admin
  ]
}


