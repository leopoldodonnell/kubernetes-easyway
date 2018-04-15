
data "google_compute_zones" "available" {}

provider "random" {
    version = "~> 1.1"
}

resource "random_string" "cluster_password" {
    length = 16
    special = true
}

resource "google_container_cluster" "primary" {
  name = "${var.cluster_name}"
  zone = "${data.google_compute_zones.available.names[0]}"
  initial_node_count = 3

  min_master_version = "${var.kubernetes_version}"
  node_version = "${var.kubernetes_version}"

  additional_zones = [
    "${data.google_compute_zones.available.names[1]}"
  ]

  master_auth {
    username = "${var.cluster_username}"
    password = "${random_string.cluster_password.result}"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}

