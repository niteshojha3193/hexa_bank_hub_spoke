output "kv_ids" {
  description = "Key Vault IDs"
  value = {
    for k, v in azurerm_key_vault.kv :
    k => v.id
  }
}

output "kv_names" {
  description = "Key Vault Names"
  value = {
    for k, v in azurerm_key_vault.kv :
    k => v.name
  }
}