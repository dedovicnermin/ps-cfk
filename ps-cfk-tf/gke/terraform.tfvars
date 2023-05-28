# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

project_id     = "solutionsarchitect-01"
region         = "us-central1"
cluster_name   = "ndedovic-cluster"
owner_label    = "ndedovic"
node_locations = ["us-central1-c"]

node_count_zk        = 3
node_machine_type_zk = "e2-medium"
node_disk_size_gb_zk = "25"

node_count_bk        = 3
node_machine_type_bk = "e2-standard-4"
node_disk_size_gb_bk = "25"

node_count_general        = 4
node_machine_type_general = "e2-standard-2"
node_disk_size_gb_gen     = "25"
