resource "azurerm_virtual_network" "hub" {
  for_each = var.hub

  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space
}

resource "azurerm_subnet" "fw" {
  for_each = var.hub

  name                 = "AzureFirewallSubnet"
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.firewall_subnet
}