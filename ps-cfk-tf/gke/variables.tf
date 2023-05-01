variable "cluster_name" {
  default = "ndedovic-cluster"
  description = "Name for gke cluster"
}

variable "owner_label" {
  default = "ndedovic"
  description = "GKE resource metadata included for all infra provisioned"
}
variable "project_id" {
  description = "project id"
  default = "solutionsarchitect-01"
}

variable "region" {
  description = "region"
}


variable "node_locations" {
  default = ["us-central1-c"]
  type = list(string)
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "node_count_zk" {
  default     = 3
  description = "number of gke nodes for zookeeper node group"
}

variable "node_count_bk" {
  default = 3
  description = "number of gke nodes for broker node group"
}

variable "node_count_general" {
  default = 4
  description = "number of gke nodes for general purpose node group"
}