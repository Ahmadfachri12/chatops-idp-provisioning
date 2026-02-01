resource "kubernetes_namespace_v1" "env_ns" {
  metadata {
    name = var.env_name
  }
}

resource "helm_release" "nginx" {
  name       = "${var.env_name}-nginx"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "nginx"

  namespace  = kubernetes_namespace_v1.env_ns.metadata[0].name
  wait       = false

  depends_on = [
    kubernetes_namespace_v1.env_ns
  ]

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
}
