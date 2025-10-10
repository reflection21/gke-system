data "google_project" "project" {}
# binding registry key to registry
resource "google_kms_crypto_key_iam_member" "registry_kms" {
  crypto_key_id = var.registry_key
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:service-${data.google_project.project.number}9@gcp-sa-artifactregistry.iam.gserviceaccount.com"
}

resource "google_artifact_registry_repository" "docker_repo" {
  location      = var.gcp_region
  repository_id = "my-docker-repo"
  format        = "DOCKER"
  description   = "Docker repo for my apps"
  kms_key_name  = var.registry_key
  labels = {
    env = "${var.deployment_prefix}-docker-repo"
  }
  depends_on = [google_kms_crypto_key_iam_member.registry_kms.id]
}
