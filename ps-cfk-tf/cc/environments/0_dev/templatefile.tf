variable "ccloud_config_templatefile" {
  default = "ccloud_client.tftpl"
}

variable "ccloud_config_localfile" {
  default = "ccloud_config.properties"
}

resource "local_file" "ccloud_config" {
  content = templatefile(
    "${path.module}/${var.ccloud_config_templatefile}",
    {
      bootstrap_servers = confluent_kafka_cluster.basic-cluster.bootstrap_endpoint,
      client_username = module.dev_pscfk_service_accounts.env_manager_apikey,
      client_password = module.dev_pscfk_service_accounts.env_manager_apisecret,
      sr_url = confluent_schema_registry_cluster.sr-cluster.rest_endpoint,
      sr_credentials = "${module.dev_pscfk_service_accounts.sr_em_key}:${module.dev_pscfk_service_accounts.sr_em_secret}"
    }
  )
  filename = var.ccloud_config_localfile
  file_permission = "664"
}