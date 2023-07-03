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

resource "confluent_environment" "env" {
  display_name = var.environment_display_name
}




resource "confluent_kafka_cluster" "basic-cluster" {

  display_name = var.kafka_cluster_display_name
  availability = var.kafka_cluster_availability
  cloud = var.kafka_cluster_cloud_provider
  region = var.aws_region

  
  standard {}

  
  environment {
    id = confluent_environment.env.id
  }
}





module "test_pscfk_service_accounts" {
  source = "../../modules/confluent_service_accounts"
  cluster_id = confluent_kafka_cluster.basic-cluster.id
  cluster_api_version = confluent_kafka_cluster.basic-cluster.api_version
  cluster_rest_endpoint = confluent_kafka_cluster.basic-cluster.rest_endpoint
  cluster_rbac_crn = confluent_kafka_cluster.basic-cluster.rbac_crn
  cluster_kind = confluent_kafka_cluster.basic-cluster.kind
  environment_display_name = var.environment_display_name
  environment_resource_name = confluent_environment.env.resource_name
  environment_id = confluent_environment.env.id
  sr_cluster_id = confluent_schema_registry_cluster.sr-cluster.id
  sr_cluster_apiversion = confluent_schema_registry_cluster.sr-cluster.api_version
  sr_cluster_kind = confluent_schema_registry_cluster.sr-cluster.kind
  access_key = var.access_key
  secret_key = var.secret_key
}
