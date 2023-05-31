variable "cluster_name" {
  default     = "ndedovic-cluster"
  description = "Name for gke cluster"
}

variable "owner_label" {
  default     = "ndedovic"
  description = "GKE resource metadata included for all infra provisioned"
}
variable "project_id" {
  description = "project id"
  default     = "solutionsarchitect-01"
}

variable "region" {
  description = "region"
}


variable "node_locations" {
  default = ["us-central1-c"]
  type    = list(string)
}


variable "node_count_zk" {
  default     = 3
  description = "number of gke nodes for zookeeper node group"
}

variable "node_count_bk" {
  default     = 3
  description = "number of gke nodes for broker node group"
}

variable "node_count_general" {
  default     = 4
  description = "number of gke nodes for general purpose node group"
}

variable "node_count_ora" {
  default     = 0
  description = "number of gke nodes for oracledb purpose node group"
}

variable "node_machine_type_ora" {
  default     = "e2-standard-4"
  description = "Image type for nodes within the ora (oracle) worker node group"
}

variable "node_machine_type_general" {
  default     = "e2-standard-2"
  description = "Image type for nodes within the general worker node group"
}

variable "node_machine_type_bk" {
  default     = "e2-standard-4"
  description = "Image type for nodes within the broker worker node group"
}

variable "node_machine_type_zk" {
  default     = "e2-small"
  description = "Image type for nodes within the zookeeper worker node group"
}

variable "node_disk_size_gb_zk" {
  default = "25"
}

variable "node_disk_size_gb_bk" {
  default = "25"
}

variable "node_disk_size_gb_gen" {
  default = "25"
}

variable "node_disk_size_gb_ora" {
  default = "25"
}