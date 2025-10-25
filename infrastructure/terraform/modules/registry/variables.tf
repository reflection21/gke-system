variable "region" {
  type        = string
  description = "GCP Region."
}

variable "registry_key" {
  type        = string
  description = "key for encrypt repo"
}

variable "project_id" {
  type        = string
  description = "GCP Project ID where resources will be created."
}

variable "deployment_prefix" {
  description = "Prefix of the deployment"
  type        = string
}
