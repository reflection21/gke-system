terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }

  }
  required_version = ">= 1.12.0"
}
