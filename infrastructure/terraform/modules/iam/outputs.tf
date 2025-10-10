output "node_pool_sa" {
  value       = google_service_account.node_pool.email
  description = "node pool sa"
}

output "bastion_host_sa" {
  value       = google_service_account.bastion_host.email
  description = "bastion host sa"
}
