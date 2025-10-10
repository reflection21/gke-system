variable "project_id" {
  type        = string
  description = "GCP Project ID where resources will be created."
}

variable "region" {
  type        = string
  description = "GCP Region."
}

variable "vpc_network" {
  type        = string
  description = "vpc"
}

variable "bastion_subnet" {
  type        = string
  description = "bastion subnet"
}

variable "bastion_host_sa" {
  type        = string
  description = "sa bastion host"
}
