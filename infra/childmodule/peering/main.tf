resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  for_each = var.peering

  name                      = "hub-to-spoke-${each.key}"
  resource_group_name       = each.value.rg_name
  virtual_network_name      = each.value.hub_vnet_name
  remote_virtual_network_id = each.value.spoke_vnet_id
}

resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  for_each = var.peering

  name                      = "spoke-to-hub-${each.key}"
  resource_group_name       = each.value.rg_name
  virtual_network_name      = each.value.spoke_vnet_name
  remote_virtual_network_id = each.value.hub_vnet_id
}