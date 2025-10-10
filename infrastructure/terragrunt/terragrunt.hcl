locals {
  project_id        = "gke-system"
  deployment_prefix = "prod"
  region            = "europe-west10"

  default_tags = {
    "TerminationDate"  = "Permanent",
    "Environment"      = "Prod",
    "Team"             = "DevOps",
    "DeployedBy"       = "Terraform",
    "OwnerEmail"       = "artembryhynets@gmail.com"
    "DeploymentPrefix" = local.deployment_prefix
  }
}
# Configure Terragrunt to automatically store tfstate files in an Google Cloud Storage bucket
remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket   = "terraform-state-gcp-system"
    prefix   = "${path_relative_to_include()}/terraform.tfstate"
    project  = local.project_id
    location = local.region
  }
}

# Generate an GCP provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "google" {
  project = var.project_id
  region  = var.region
}
EOF
}

retryable_errors = [
  "(?s).*Error.*Required plugins are not installed.*"
]

inputs = {
  project_id        = local.project_id
  region            = local.region
  deployment_prefix = local.deployment_prefix
  default_tags      = local.default_tags
}
