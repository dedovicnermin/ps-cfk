
# GKE cluster
resource "google_container_cluster" "gke_cluster" {
  name     = "ndedovic-cluster"
  location = "us-central1"
  default_max_pods_per_node = "110"
  logging_config {
    enable_components = [ 
      "SYSTEM_COMPONENTS",
      "WORKLOADS"
     ]
  }
  monitoring_config {
    enable_components = [ "SYSTEM_COMPONENTS" ]
  }
  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }
    http_load_balancing {
      disabled = false
    }
    gcp_filestore_csi_driver_config {
      enabled = true
    }
  }
  networking_mode = "VPC_NATIVE"
  ip_allocation_policy {
    cluster_ipv4_cidr_block = ""
    
  }
  enable_intranode_visibility = false

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = data.google_compute_network.default.name
  subnetwork = data.google_compute_subnetwork.subnet.name
  enable_shielded_nodes = true

  resource_labels = {
    owner = var.owner_label
  }
}

# Separately Managed Node Pool
resource "google_container_node_pool" "zk_nodes" {
  name       = "${var.owner_label}-zk"
  location   = var.region
  cluster    = google_container_cluster.gke_cluster.name
  node_count = var.node_count_zk
  node_locations = var.node_locations

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append"
    ]

    labels = {
      owner = var.owner_label
      app = "zookeeper"
      cluster = var.cluster_name
    }
    # preemptible  = true
    machine_type = "e2-small"
    image_type = "COS_CONTAINERD"
    disk_type = "pd-balanced"
    disk_size_gb = "25"
    taint = [
      {
        effect = "NO_SCHEDULE"
        key    = "app"
        value  = "zookeeper"
      }
    ]
    metadata = {
      disable-legacy-endpoints = "true"
      owner = var.owner_label
    }
  }
}

resource "google_container_node_pool" "bk_nodes" {
  name       = "${var.owner_label}-bk"
  location   = var.region
  cluster    = google_container_cluster.gke_cluster.name
  node_count = var.node_count_bk
  node_locations = var.node_locations
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append"
    ]

    labels = {
      owner = var.owner_label
      app = "kafka"
      cluster = var.cluster_name
    }
    # preemptible  = true
    machine_type = "e2-standard-4"
    image_type = "COS_CONTAINERD"
    disk_type = "pd-balanced"
    disk_size_gb = "25"
    taint = [
      {
        effect = "NO_SCHEDULE"
        key    = "app"
        value  = "kafka"
      }
    ]
    metadata = {
      disable-legacy-endpoints = "true"
      owner = var.owner_label
    }
  }
}


resource "google_container_node_pool" "gen_nodes" {
  name       = "${var.owner_label}-gen"
  location   = var.region
  cluster    = google_container_cluster.gke_cluster.name
  node_count = var.node_count_general
  node_locations = var.node_locations
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append"
    ]

    labels = {
      owner = var.owner_label
      app = "general"
      cluster = var.cluster_name
    }
    # preemptible  = true
    machine_type = "e2-standard-2"
    image_type = "COS_CONTAINERD"
    disk_type = "pd-balanced"
    disk_size_gb = "25"
    metadata = {
      disable-legacy-endpoints = "true"
      owner = var.owner_label
    }
  }
}


