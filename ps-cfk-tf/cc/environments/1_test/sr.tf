data "confluent_schema_registry_region" "sr-region" {
  cloud   = var.kafka_cluster_cloud_provider
  region  = "us-east-2"
  package = "ESSENTIALS"
}

resource "confluent_schema_registry_cluster" "sr-cluster" {
  package = data.confluent_schema_registry_region.sr-region.package

  environment {
    id = confluent_environment.env.id
  }


  region {
    id = data.confluent_schema_registry_region.sr-region.id
  }
}

resource "confluent_schema_registry_cluster_mode" "sr-cluster-mode" {
  mode = "READWRITE"
  schema_registry_cluster {
    id = confluent_schema_registry_cluster.sr-cluster.id
  }
  rest_endpoint = confluent_schema_registry_cluster.sr-cluster.rest_endpoint
  credentials {
    key    = module.test_pscfk_service_accounts.sr_em_key
    secret = module.test_pscfk_service_accounts.sr_em_secret
  }

}


output "sr_id" {
  value = confluent_schema_registry_cluster.sr-cluster.id
}

output "sr_api_version" {
  value = confluent_schema_registry_cluster.sr-cluster.api_version
}

output "sr_rest_endpoint" {
  value = confluent_schema_registry_cluster.sr-cluster.rest_endpoint
}

output "sr_display_name" {
  value = confluent_schema_registry_cluster.sr-cluster.display_name
}

output "sr_resource_name" {
  value = confluent_schema_registry_cluster.sr-cluster.resource_name
}
