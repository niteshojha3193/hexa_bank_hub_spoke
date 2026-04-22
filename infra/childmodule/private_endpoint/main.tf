resource "azurerm_private_endpoint" "acr_pe" {
  for_each = var.acr_ids   # 👈 IMPORTANT CHANGE

  name                = "acr-pe-${each.key}"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "acr-conn-${each.key}"
    private_connection_resource_id = each.value   # 👈 VALUE = ACR ID
    subresource_names              = ["registry"]
    is_manual_connection           = false   
  } 
}