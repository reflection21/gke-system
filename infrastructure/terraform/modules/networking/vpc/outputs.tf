output "vpc_network" {
  value       = google_compute_network.my_vpc.name
  description = "output of vpc"
}

output "node_subnet" {
  value       = google_compute_subnetwork.node_subnet.name
  description = "node subnet"
}

output "bastion_subnet" {
  value       = google_compute_subnetwork.bastion_subnet.id
  description = "bastion subnet"
}

output "db_subnet" {
  value       = google_compute_subnetwork.db_subnet.id
  description = "db subnet"
}

output "node_subnet_cidr" {
  value       = google_compute_subnetwork.node_subnet.ip_cidr_range
  description = "CIDR range of the node subnet"
}

output "bastion_subnet_cidr" {
  value       = google_compute_subnetwork.bastion_subnet.ip_cidr_range
  description = "CIDR range of the bastion subnet"
}
