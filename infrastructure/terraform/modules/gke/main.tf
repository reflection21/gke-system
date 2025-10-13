# availablity zones
data "google_compute_zones" "available_zones" {
  region = var.region
  status = "UP"
}
# gke
resource "google_container_cluster" "my_cluster" {
  name           = "${var.deployment_prefix}-k8s-cluster"
  location       = var.region
  node_locations = slice(data.google_compute_zones.available_zones.names, 0, 2)
  ip_allocation_policy {
    cluster_secondary_range_name  = "pod-subnet"
    services_secondary_range_name = "service-subnet"
  }
  deletion_protection      = false
  initial_node_count       = 1
  remove_default_node_pool = true
  network                  = var.vpc_network
  subnetwork               = var.node_subnet

  # private cluster
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "10.4.20.0/28"
  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.bastion_subnet_cidr
      display_name = "bastion"
    }
    cidr_blocks {
      cidr_block   = var.node_subnet_cidr
      display_name = "workers"
    }
  }

  # enable_intranode_visibility = true

  # default_snat_status {
  #   disabled = true # disable node nat
  # }

  #   service_external_ips_config {
  #   enabled = false
  # }

  # database_encryption {
  #   state = "DECRYPTED"
  # }

  # network_policy {
  #   enabled = true
  # }

  # addons_config {
  #   network_policy_config {
  #     disabled = false #  enable the network policy addon for the master
  #   }
  # gcp_filestore_csi_driver_config {
  #   enabled = true # volume
  # }
  # gcs_fuse_csi_driver_config {
  #   enabled = true # bucket
  # }
  # dns_cache_config {
  #   enabled = true
  # }
  # gce_persistent_disk_csi_driver_config {
  #   enabled = true
  # }
  # gke_backup_agent_config {
  #   enabled = true
  # }
  # }


  release_channel {
    channel = "STABLE"
  }

  resource_labels = {
    env  = "${var.deployment_prefix}-k8s"
    team = "devops"
  }
  timeouts {
    create = "25m"
    update = "15m"
    delete = "10m"
  }

}
# node pool
resource "google_container_node_pool" "node_pool" {
  name       = "my-node-pool"
  location   = var.region
  cluster    = google_container_cluster.my_cluster.name
  node_count = 1
  node_config {
    service_account = var.node_pool_sa
    boot_disk {
      size_gb   = 50
      disk_type = "pd-balanced"
    }
    shielded_instance_config {
      enable_secure_boot          = true # Ensure node boot components are verified
      enable_integrity_monitoring = true
    }
    preemptible  = true
    machine_type = "e2-standard-2"

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

  }
  autoscaling {
    min_node_count = 1
    max_node_count = 2
    # total_min_node_count = 2
    # total_max_node_count = 4
    location_policy = "BALANCED"
  }

  management {
    auto_upgrade = true # Enable auto-upgrade nodes
    auto_repair  = true
  }
}
