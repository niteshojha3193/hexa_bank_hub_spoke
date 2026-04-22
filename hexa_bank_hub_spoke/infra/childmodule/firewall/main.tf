resource "azurerm_public_ip" "fw_ip" {
  for_each = var.firewall

  name                = "fw-ip-${each.key}"
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "fw" {
  for_each = var.firewall

  name                = "bank-fw-${each.key}"
  location            = each.value.location
  resource_group_name = each.value.rg_name

  sku_name = "AZFW_VNet"
  sku_tier = "Standard"

  ip_configuration {
    name                 = "fw-config"
    subnet_id            = each.value.subnet_id
    public_ip_address_id = azurerm_public_ip.fw_ip[each.key].id
  }
}