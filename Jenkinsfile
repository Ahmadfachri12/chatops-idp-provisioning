pipeline {
    agent any

    parameters {
        string(name: 'ENV_NAME', defaultValue: 'deployment', description: 'Nama environment')
    }

    tools {
        terraform 'terraform-default'
    }

    stages {
        stage('Persiapan') {
            steps {
                echo "Memulai provisioning untuk: ${params.ENV_NAME}"
                writeFile file: 'main.tf', text: """
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.16.0"
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

variable "env_name" {
  type = string
}

resource "kubernetes_namespace" "env_ns" {
  metadata {
    name = "env-\${var.env_name}"
  }
}

resource "helm_release" "app_deploy" {
  name       = "\${var.env_name}-nginx"
  
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "nginx"
  
  namespace  = kubernetes_namespace.env_ns.metadata.0.name
  depends_on = [ kubernetes_namespace.env_ns ]
  
  # Agar tidak menunggu lama
  wait       = false

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
}
"""
            }
        }

        stage('Terraform Provision') {
            steps {
                script {
                    sh 'rm -rf .terraform .terraform.lock.hcl'
                    sh 'terraform init'
                    sh "terraform apply -auto-approve -var=\"env_name=${params.ENV_NAME}\""
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}