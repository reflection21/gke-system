resource "random_password" "root_password" {
  length           = 32
  min_lower        = 1
  min_numeric      = 3
  min_special      = 3
  min_upper        = 3
  special          = true
  numeric          = true
  upper            = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "google_secret_manager_secret" "my_passwords" {
  secret_id = "my-passwords"
  labels = {
    environment = "prod"
    purpose     = "database"
  }

  replication {
    auto {} # Автоматическая репликация (управляется GCP)
  }
  deletion_protection = false
}

resource "google_secret_manager_secret_version" "root_password_version" {
  secret      = google_secret_manager_secret.my_passwords.id
  secret_data = random_password.root_password.result
  depends_on  = [google_secret_manager_secret.my_passwords]
}

# resource "google_secret_manager_secret_iam_member" "secret_access" {
#   secret_id  = google_secret_manager_secret.root_credentials.id
#   role       = "roles/secretmanager.secretAccessor"
#   member     = "serviceAccount:your-service-account@your-gcp-project-id.iam.gserviceaccount.com"  # Укажи email сервисного аккаунта
# }
