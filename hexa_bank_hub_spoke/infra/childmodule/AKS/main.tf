resource "azurerm_kubernetes_cluster" "aks" {
  for_each = var.aks

  name                = each.value.aks_name
  location            = each.value.aks_location
  resource_group_name = each.value.rg_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = each.value.node_pool_name
    node_count = each.value.node_count
    vm_size    = each.value.vm_size

    vnet_subnet_id = var.subnet_id
  }

  identity {
    type = each.value.type_identity
  }

  private_cluster_enabled = true

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  # 🔥 YE USE KAR (NEW SYNTAX)
  ingress_application_gateway {
    subnet_id = var.appgw_subnet_id
  }
}