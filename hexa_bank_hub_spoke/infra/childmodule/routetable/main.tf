resource "azurerm_route_table" "rt" {
  for_each = var.routetable

  name                = "aks-rt-${each.key}"
  location            = each.value.location
  resource_group_name = each.value.rg_name
}

resource "azurerm_route" "default" {
  for_each = var.routetable

  name                   = "default-${each.key}"
  resource_group_name    = each.value.rg_name
  route_table_name       = azurerm_route_table.rt[each.key].name
  address_prefix         = "0.0.0.0/0"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = each.value.firewall_ip
}

resource "azurerm_subnet_route_table_association" "assoc" {
  for_each = var.routetable

  subnet_id      = each.value.subnet_id
  route_table_id = azurerm_route_table.rt[each.key].id
}