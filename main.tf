provider "google" {
  project     = "testuvannya01"
  region      = "us-west1"
  zone        = "us-west1-b"
  user_project_override = true
  credentials = file("gcloudacc.json")
}
resource "google_compute_instance" "my_instance_GH_actions" {
  name = "github_actions"
  machine_type = "e2-small"
  allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20201014"
    }
  }
}
