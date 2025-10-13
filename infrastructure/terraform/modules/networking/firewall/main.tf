# ssh connect to bastion host
resource "google_compute_firewall" "ssh_bastion" {
  name          = "ssh-connect-bh"
  network       = var.vpc_network
  source_ranges = ["35.235.240.0/20"]
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["bastion-host"]
}

resource "google_project_iam_member" "iap_tunnel" {
  project = var.project_id
  role    = "roles/iap.tunnelResourceAccessor"
  member  = "serviceAccount:deploy-user@my-system-474719.iam.gserviceaccount.com" # root
}

