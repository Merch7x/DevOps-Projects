output "kubeconfig" {
  value = linode_lke_cluster.dev.kubeconfig
  sensitive = true
}

output "api_endpoints" {
  value = linode_lke_cluster.dev.api_endpoints
}

output "status" {
  value = linode_lke_cluster.dev.status
}

output "id" {
  value = linode_lke_cluster.dev.id
}

output "pool" {
  value = linode_lke_cluster.dev.pool
}