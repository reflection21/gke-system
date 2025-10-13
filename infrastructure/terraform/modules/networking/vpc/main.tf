# vpc
resource "google_compute_network" "my_vpc" {
  name                            = "my-k8s-vpc"
  routing_mode                    = "REGIONAL"
  mtu                             = 1460
  auto_create_subnetworks         = false
  delete_default_routes_on_create = false
}
# kubernetes workers subnet
resource "google_compute_subnetwork" "node_subnet" {
  region                   = var.region
  name                     = "node-subnet"
  network                  = google_compute_network.my_vpc.name
  stack_type               = "IPV4_ONLY"
  ip_cidr_range            = "192.168.0.0/24"
  private_ip_google_access = true
  secondary_ip_range {
    range_name    = "pod-subnet"
    ip_cidr_range = "10.1.0.0/16"
  }
  secondary_ip_range {
    range_name    = "service-subnet"
    ip_cidr_range = "10.2.0.0/20"
  }
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}
# bastion subnet
resource "google_compute_subnetwork" "bastion_subnet" {
  name                     = "bastion-subnet"
  network                  = google_compute_network.my_vpc.name
  stack_type               = "IPV4_ONLY"
  ip_cidr_range            = "192.168.11.0/29"
  private_ip_google_access = true
  log_config {
    aggregation_interval = "INTERVAL_5_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}
# db subnet
resource "google_compute_subnetwork" "db_subnet" {
  name                     = "database-subnet"
  network                  = google_compute_network.my_vpc.name
  stack_type               = "IPV4_ONLY"
  ip_cidr_range            = "192.168.12.0/29"
  private_ip_google_access = true
  log_config {
    aggregation_interval = "INTERVAL_5_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}
# router
resource "google_compute_router" "router" {
  name        = "router"
  description = "Cloud Router for private NAT"
  region      = var.region
  network     = google_compute_network.my_vpc.name

}
# nat
resource "google_compute_router_nat" "nat" {
  name                               = "nat"
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  type                               = "PUBLIC"

  subnetwork {
    name                    = google_compute_subnetwork.bastion_subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
  subnetwork {
    name                    = google_compute_subnetwork.node_subnet.id
    source_ip_ranges_to_nat = ["PRIMARY_IP_RANGE"]
  }
  log_config {
    enable = true
    filter = "ALL"
  }
}

# resource "google_compute_route" "default_internet" {
#   name             = "default-internet-route"
#   network          = google_compute_network.my_vpc.name
#   dest_range       = "0.0.0.0/0"
#   next_hop_gateway = "default-internet-gateway"
#   priority         = 1000
# }
