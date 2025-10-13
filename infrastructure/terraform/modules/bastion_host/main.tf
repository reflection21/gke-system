data "google_compute_zones" "available_zones" {
  region = var.region
  status = "UP"
}

resource "google_compute_instance" "bastion_host" {
  name                      = "bastion-host"
  description               = "private bastion host virtual machine e2-small"
  zone                      = data.google_compute_zones.available_zones.names[0]
  machine_type              = "e2-small"
  allow_stopping_for_update = true
  deletion_protection       = false

  network_interface {
    network    = var.vpc_network
    subnetwork = var.bastion_subnet
  }

  boot_disk {
    initialize_params {
      image        = "debian-12"
      type         = "pd-balanced"
      size         = "10"
      architecture = "X86_64"
      labels = {
        my_label = "bastion-host"
      }
    }
  }

  service_account {
    email  = var.bastion_host_sa
    scopes = ["cloud-platform"]
  }

  metadata = {
    enable-oslogin = "TRUE" # Enables or disables SSH key management on your project
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    set -e
    sudo apt-get update -y && apt-get install kubectl google-cloud-cli-gke-gcloud-auth-plugin -y
  EOT

  tags = ["bastion-host"]
}
