resource "confluent_cluster_link" "cfkcl" {
  link_name = "cfkcl"
  link_mode = "DESTINATION"
  connection_mode = "INBOUND"

  config = {
    "acl.sync.enable" = false
    "acl.sync.ms" = 5000
    "auto.create.mirror.topics.enable" = true

    "auto.create.mirror.topics.filters" = <<EOF
                                          {
                                            "topicFilters": [
                                              {"name": "avro",  "patternType": "PREFIXED",  "filterType": "INCLUDE"},
                                              {"name": "leaderboard",  "patternType": "PREFIXED",  "filterType": "INCLUDE"}
                                            ]
                                          }
                                          EOF
    "consumer.offset.group.filters" = <<EOF
                                      {
                                        "groupFilters": [
                                          {"name": "*",  "patternType": "LITERAL",  "filterType": "INCLUDE"},
                                          {"name": "leader", "patternType": "PREFIXED", "filterType": "INCLUDE"}
                                        ]
                                      }
                                      EOF
    "consumer.offset.sync.enable" = true
    "consumer.offset.sync.ms" = 15000
    "topic.config.sync.ms" = 60000
    "acl.filters" = <<EOF
                    {
                      "aclFilters": [
                      {
                        "resourceFilter": {"resourceType": "any",  "patternType": "any"},
                        "accessFilter": {"operation": "any", "permissionType": "any"}
                      }
                      ]
                    }
                    EOF
  }
  source_kafka_cluster {
    id = "-DwQmCl5Ry28v3XVsg4cUw"
    bootstrap_endpoint = "mock:9092"
  }

  destination_kafka_cluster {
    id = confluent_kafka_cluster.basic-cluster.id
    rest_endpoint = confluent_kafka_cluster.basic-cluster.rest_endpoint
    credentials {
      key    = module.qa_pscfk_service_accounts.env_manager_apikey
      secret = module.qa_pscfk_service_accounts.env_manager_apisecret
    }
  }
}





output "cfk_cl_id" {
  value = confluent_cluster_link.cfkcl.id
}


output "cfk_cl_config" {
  value = confluent_cluster_link.cfkcl.config
}

