variable "vpc_network" {
  type        = string
  description = "network for gke"
}

variable "subnetwork" {
  type        = string
  description = "network for gke"
}

variable "project_id" {
  type        = string
  description = "GCP Project ID where resources will be created."
}

variable "region" {
  type        = string
  description = "GCP Region."
}

variable "deployment_prefix" {
  description = "Prefix of the deployment"
  type        = string
}

variable "bastion_subnet_cidr" {
  description = "bastion subnet"
  type        = string
}

variable "worker_subnet_cidr" {
  description = "bastion subnet"
  type        = string
}

variable "node_pool_sa" {
  description = "node_pool_sa"
  type        = string
}
