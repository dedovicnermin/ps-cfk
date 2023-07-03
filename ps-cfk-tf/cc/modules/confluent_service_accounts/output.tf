output "env_manager_apikey" {
  value = confluent_api_key.env-manager-kafka-api-key.id
}
output "env_manager_apisecret" {
  value = confluent_api_key.env-manager-kafka-api-key.secret
}

output "env_manager_id" {
  value = confluent_service_account.env-manager.id
}


output "sr_em_key" {
  value = confluent_api_key.sr_env_manager_apikey.id
}

output "sr_em_secret" {
  value = confluent_api_key.sr_env_manager_apikey.secret
}