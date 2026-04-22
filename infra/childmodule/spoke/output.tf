output "vnet_ids" {
  description = "Spoke VNet IDs"
  value = {
    for k, v in azurerm_virtual_network.spoke :
    k => v.id
  }
}

output "vnet_names" {
  description = "Spoke VNet Names"
  value = {
    for k, v in azurerm_virtual_network.spoke :
    k => v.name
  }
}

output "aks_subnet_ids" {
  description = "AKS Subnet IDs"
  value = {
    for k, v in azurerm_subnet.aks :
    k => v.id
  }
}

output "appgw_subnet_ids" {
  description = "App Gateway Subnet IDs"
  value = {
    for k, v in azurerm_subnet.appgw :
    k => v.id
  }
}