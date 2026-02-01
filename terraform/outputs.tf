#######################################
# Output: Namespace Name
#######################################
output "namespace_name" {
  description = "Nama namespace yang dibuat"
  value       = kubernetes_namespace_v1.env_ns.metadata[0].name
}

#######################################
# Output: Helm Release Name
#######################################
output "helm_release_name" {
  description = "Nama Helm release nginx"
  value       = helm_release.nginx.name
}

#######################################
# Output: Environment
#######################################
output "environment" {
  description = "Environment yang sedang diprovisioning"
  value       = var.env_name
}
