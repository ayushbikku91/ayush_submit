resource "google_compute_instance" "my_vm" {
  name         = "my-vm"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.my_network.name
    access_config {
      // Ephemeral IP
    }
  }

  # Add SSH key and other configuration as needed.
}
