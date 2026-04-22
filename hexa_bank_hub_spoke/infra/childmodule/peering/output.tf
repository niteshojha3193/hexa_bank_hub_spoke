output "hub_to_spoke_peering_ids" {
  description = "Hub to Spoke Peering IDs"
  value = {
    for k, v in azurerm_virtual_network_peering.hub_to_spoke :
    k => v.id
  }
}

output "spoke_to_hub_peering_ids" {
  description = "Spoke to Hub Peering IDs"
  value = {
    for k, v in azurerm_virtual_network_peering.spoke_to_hub :
    k => v.id
  }
}