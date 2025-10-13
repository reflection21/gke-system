terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.20"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.8"
    }
  }
  required_version = ">= 1.12.0"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}
