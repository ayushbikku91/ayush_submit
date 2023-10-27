resource "google_container_cluster" "my_cluster" {
  name               = "my-cluster"
  location           = "us-central1"
  initial_node_count = 1

  node_config {
    machine_type = "n1-standard-2"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
    ]
  }

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  network     = google_compute_network.my_network.self_link
  subnetwork  = google_compute_subnetwork.my_subnet.self_link
  enable_ip_alias = true
}

resource "google_container_node_pool" "my_node_pool" {
  name       = "my-node-pool"
  location   = google_container_cluster.my_cluster.location
  cluster    = google_container_cluster.my_cluster.name
  node_count = 1

  node_config {
    machine_type = "n1-standard-2"
  }
}
