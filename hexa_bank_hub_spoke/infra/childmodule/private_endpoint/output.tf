output "private_endpoint_ids" {
  value = {
    for k, v in azurerm_private_endpoint.acr_pe :
    k => v.id
  }
}