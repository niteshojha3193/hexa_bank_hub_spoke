resource "azurerm_virtual_network" "spoke" {
  for_each = var.spoke

  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space
}

resource "azurerm_subnet" "aks" {
  for_each = var.spoke

  name                 = "aks-subnet"
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.aks_subnet
}

resource "azurerm_subnet" "appgw" {
  for_each = var.spoke

  name                 = "appgw-subnet"
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.appgw_subnet
}