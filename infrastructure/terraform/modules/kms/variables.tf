variable "project_id" {
  type        = string
  description = "GCP Project ID where resources will be created."
}

variable "region" {
  type        = string
  description = "GCP Region."
}

variable "sa_node_pool" {
  type        = string
  description = "service acc node pool"
}
