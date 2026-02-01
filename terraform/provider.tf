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

# Provider Kubernetes
# Cukup arahkan ke config path, setting insecure sudah ada di dalam file-nya
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Provider Helm
# Kosongkan saja bloknya.
# Provider ini akan otomatis mencari ~/.kube/config dan mengikuti setting yang ada di sana.
provider "helm" {
}
