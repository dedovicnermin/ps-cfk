variable "environment_display_name" {
    type = string
    description = "environment display name"
}

variable "kafka_cluster_display_name" {
    type = string
    description = "kafka cluster display name"
}

variable "kafka_cluster_availability" {
    type = string
    description = "kafka cluster availability i.e. SINGLE_ZONE"
}

variable "kafka_cluster_cloud_provider" {
    type = string
    description = "kafka cluster cloud provider i.e. AWS"
}

variable "aws_region" {
    type = string
    description = "aws region"
}

variable "kafka_cluster_cku" {
    type = number
    description = "The number of Confluent Kafka Units (CKUs) for Dedicated cluster types"
}

variable "access_key" {
    type = string
}

variable "secret_key" {
    type = string
}