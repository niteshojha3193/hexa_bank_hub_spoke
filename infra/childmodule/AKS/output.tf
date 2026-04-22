output "aks_ids" {
  description = "AKS Cluster IDs"
  value = {
    for k, v in azurerm_kubernetes_cluster.aks :
    k => v.id
  }
}

output "aks_names" {
  description = "AKS Cluster Names"
  value = {
    for k, v in azurerm_kubernetes_cluster.aks :
    k => v.name
  }
}

output "kube_config" {
  description = "Kubeconfig for AKS"
  sensitive   = true
  value = {
    for k, v in azurerm_kubernetes_cluster.aks :
    k => v.kube_config_raw
  }
}

output "node_resource_group" {
  description = "Node resource group"
  value = {
    for k, v in azurerm_kubernetes_cluster.aks :
    k => v.node_resource_group
  }
}