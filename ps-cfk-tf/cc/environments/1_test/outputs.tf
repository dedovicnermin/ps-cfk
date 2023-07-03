output "cluster_id" {
  value = confluent_kafka_cluster.basic-cluster.id
}

output "api_version" {
  value = confluent_kafka_cluster.basic-cluster.api_version
}

output "bootstrap_endpoint" {
  value = confluent_kafka_cluster.basic-cluster.bootstrap_endpoint
}

output "rest_endpoint" {
  value = confluent_kafka_cluster.basic-cluster.rest_endpoint
}

output "rbac_crn" {
  value = confluent_kafka_cluster.basic-cluster.rbac_crn
}

output "env_manager_creds" {
  sensitive = true
  value = "${module.test_pscfk_service_accounts.env_manager_apikey}:${module.test_pscfk_service_accounts.env_manager_apisecret}"
}


output "sr_em_creds" {
  sensitive = true
  value = "${module.test_pscfk_service_accounts.sr_em_key}:${module.test_pscfk_service_accounts.sr_em_secret}"
}
