terraform {

  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.43.0"
    }
    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

provider "confluent" {
  cloud_api_key = var.access_key
  cloud_api_secret = var.secret_key
}

provider "local" {

}