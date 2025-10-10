output "root_password" {
  value       = random_password.root_password.result
  description = "passwd database"
  sensitive   = true
}
