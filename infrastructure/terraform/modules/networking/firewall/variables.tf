variable "vpc_network" {
  type        = string
  description = "my vpc"
}

variable "project_id" {
  type        = string
  description = "GCP Project ID where resources will be created."
}

variable "region" {
  type        = string
  description = "GCP Region."
}

variable "bastion_subnet" {
  type        = string
  description = "bastion subnet"
}
