# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0





data "google_compute_network" "default" {
  name    = "default"
  project = var.project_id
}

data "google_compute_subnetwork" "subnet" {
  name   = "default"
  region = var.region
}


