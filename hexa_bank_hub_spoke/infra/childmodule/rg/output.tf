output "rg_ids" {
  description = "Resource Group IDs"
  value = {
    for k, v in azurerm_resource_group.rg :
    k => v.id
  }
}

output "rg_names" {
  description = "Resource Group Names"
  value = {
    for k, v in azurerm_resource_group.rg :
    k => v.name
  }
}