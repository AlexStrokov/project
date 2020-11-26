provider "google" {
  project     = "testuvannya01"
  region      = "us-west1"
  zone        = "us-west1-b"
  user_project_override = true
}

resource "google_compute_instance" "default" {
 name         = "githubtest"
 machine_type = "e2-small"

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

