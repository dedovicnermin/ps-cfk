variable "cluster_id" {
  type = string
  description = "The ID of the Kafka cluster"
}

variable "cluster_api_version" {
  type = string
  description = "API Version of the schema version of the Kafka cluster,"
}

variable "cluster_rest_endpoint" {
  type = string
  description = "The REST endpoint of the Kafka cluster"
}

variable "cluster_rbac_crn" {
  type = string
  description = "The Confluent Resource Name of the Kafka cluster"
}

variable "cluster_kind" {
  type = string
  description = "The kind of the Kafka cluster"
}

variable "environment_display_name" {
  type = string
  description = "The enviroment name either production or developement"
}

variable "environment_resource_name" {
  type = string
  description = "The Confluent Resource Name of the Environment"
}

variable "environment_id" {
  type = string
  description = "The ID of the Environment"
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "sr_cluster_id" {
  type = string
}

variable "sr_cluster_apiversion" {
  type = string
}

variable "sr_cluster_kind" {
  type = string
}