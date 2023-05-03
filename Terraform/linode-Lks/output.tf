output "kubeconfig" {
  value = linode_lke_cluster.istio-test.kubeconfig
  sensitive = true
}

output "api_endpoints" {
  value = linode_lke_cluster.istio-test.api_endpoints
}

output "status" {
  value = linode_lke_cluster.istio-test.status
}

output "id" {
  value = linode_lke_cluster.istio-test.id
}

output "pool" {
  value = linode_lke_cluster.istio-test.pool
}