output "firewall_ids" {
  description = "Azure Firewall IDs"
  value = {
    for k, v in azurerm_firewall.fw :
    k => v.id
  }
}

output "firewall_names" {
  description = "Azure Firewall Names"
  value = {
    for k, v in azurerm_firewall.fw :
    k => v.name
  }
}

output "firewall_private_ips" {
  description = "Azure Firewall Private IPs"
  value = {
    for k, v in azurerm_firewall.fw :
    k => v.ip_configuration[0].private_ip_address
  }
}

output "firewall_public_ips" {
  description = "Azure Firewall Public IPs"
  value = {
    for k, v in azurerm_public_ip.fw_ip :
    k => v.ip_address
  }
}