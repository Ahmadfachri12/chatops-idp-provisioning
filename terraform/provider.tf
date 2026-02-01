terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 3.0.0"
    }
  }
}

provider "kubernetes" {
  config_path = "/var/jenkins_home/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "/var/jenkins_home/.kube/config"
  }
}
