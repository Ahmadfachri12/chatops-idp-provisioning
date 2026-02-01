terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
  }
}

# Provider 1: Kubernetes
provider "kubernetes" {
  config_path = "~/.kube/config"
  insecure    = true  
}

# Provider 2: Helm
provider "helm" {
  # PERHATIKAN: Konfigurasi harus dibungkus dalam blok "kubernetes"
  kubernetes { 
    config_path = "~/.kube/config"
    insecure    = true 
  }
}
