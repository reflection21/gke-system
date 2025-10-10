variable "gcp_project" {
  type        = string
  description = "GCP Project ID where resources will be created."
}

variable "gcp_region" {
  type        = string
  description = "GCP Region."
}

variable "registry_key" {
  type        = string
  description = "key for encrypt repo"
}

variable "sa_node_pool" {
  type        = string
  description = "service acc node pool"
}
