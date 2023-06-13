resource "google_compute_instance" "vm" {
  provider     = google-beta
  name         = "my-vm"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-2210-kinetic-amd64-v20230126"
    }
  }

  network_interface {
    network = "default"
  }
}

resource "google_compute_machine_image" "image" {
  provider        = google-beta
  name            = "my-image"
  source_instance = google_compute_instance.vm.self_link
}