variable "gcp_region" {
  type        = string
  description = "gcp region"
}

variable "gcp_project" {
  type        = string
  description = "gcp project"
}

variable "db_instance_name" {
  type        = string
  description = "db instance name"
  default     = "db"
}

variable "vpc" {
  type        = string
  description = "vpc"
}

variable "db_subnet" {
  type        = string
  description = "subnet for db"
}

variable "bastion_subnet" {
  type        = string
  description = "bastion subnet"
}

variable "worker_subnet" {
  type        = string
  description = "node pool subnet"
}

variable "root_password" {
  type        = string
  description = "passwd for reflection"
  sensitive   = true
}
