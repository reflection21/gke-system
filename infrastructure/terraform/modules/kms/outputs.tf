output "registry_key" {
  value       = google_kms_crypto_key.registry_key.id
  description = "encrypt repo key"
}
