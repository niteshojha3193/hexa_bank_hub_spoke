output "vnet_ids" {
  description = "Hub VNet IDs"
  value = {
    for k, v in azurerm_virtual_network.hub :
    k => v.id
  }
}

output "vnet_names" {
  description = "Hub VNet Names"
  value = {
    for k, v in azurerm_virtual_network.hub :
    k => v.name
  }
}

output "firewall_subnet_ids" {
  description = "Firewall Subnet IDs"
  value = {
    for k, v in azurerm_subnet.fw :
    k => v.id
  }
}