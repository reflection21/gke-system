# create KMS KeyRing (container for keys)
resource "google_kms_key_ring" "keys_repo" {
  name     = "repo_for_keys_newwwww"
  location = var.gcp_region
}
# create key
resource "google_kms_crypto_key" "registry_key" {
  name            = "registry-key"
  key_ring        = google_kms_key_ring.keys_repo.id
  rotation_period = "7776000s" # rotate 90 days (90*24*60*60)
  purpose         = "ENCRYPT_DECRYPT"
  lifecycle {
    prevent_destroy = false
  }
}
# binding registry key to node pool sa
resource "google_kms_crypto_key_iam_member" "gke_node_kms_access" {
  crypto_key_id = var.registry_key
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${var.sa_node_pool}"
}


