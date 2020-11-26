provider "google" {
  project     = "testuvannya01"
  region      = "us-west1"
  zone        = "us-west1-b"
  user_project_override = true
}
resource "google_compute_instance" "my_instance" {
  name = "terraform${count.index}"
  count = 2
  machine_type = "e2-small"
  allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20201014"
    }
  }
  network_interface {
    network = google_compute_network.mynet.self_link
    access_config {
    }
  }
}

resource "google_compute_network" "mynet" {
  name = "my-network-156"
  auto_create_subnetworks = "true"
  }
resource "google_compute_firewall" "mywall" {
  name    = "mywall"
  network = google_compute_network.mynet.self_link
  allow {
    protocol = "tcp"
    ports    = ["80-9090"]
   }
  }
output "ip" {
  value = google_compute_instance.my_instance.*.network_interface.0.access_config.0.nat_ip
}
