#  Identity-Aware Proxy
# resource "google_compute_firewall" "allow_iap_gke" {
#   name    = "allow-iap-gke"
#   network = var.vpc_network
#   allow {
#     protocol = "tcp"
#     ports    = ["443"] # 443 - Kubernetes API, 10250 - kubelet (if need)
#   }
#   source_ranges = ["35.235.240.0/20"] # iap network which proxy request to resourses
# }

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
  member  = "serviceAccount:gcp-terraform@gke-system.iam.gserviceaccount.com"
}

# resource "google_compute_firewall" "allow-egress" {
#   name    = "allow-egress"
#   network = var.vpc_network

#   direction          = "EGRESS"
#   priority           = 1000
#   destination_ranges = ["0.0.0.0/0"]

#   allow {
#     protocol = "tcp"
#     ports    = ["0-65535"]
#   }

#   allow {
#     protocol = "udp"
#     ports    = ["0-65535"]
#   }

#   allow {
#     protocol = "icmp"
#   }
# }
