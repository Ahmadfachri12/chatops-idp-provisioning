#######################################
# Kubernetes Namespace (Environment)
#######################################
resource "kubernetes_namespace" "env_ns" {
  metadata {
    name = "env-${var.env_name}"

    labels = {
      environment = var.env_name
      managed-by  = "terraform"
      project     = "chatops-local"
    }
  }
}

#######################################
# Helm Release - Nginx
#######################################
resource "helm_release" "nginx" {
  name       = "${var.env_name}-nginx"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "nginx"

  namespace  = kubernetes_namespace.env_ns.metadata[0].name
  wait       = false
  timeout    = 300
  atomic     = false

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  depends_on = [
    kubernetes_namespace.env_ns
  ]
}
