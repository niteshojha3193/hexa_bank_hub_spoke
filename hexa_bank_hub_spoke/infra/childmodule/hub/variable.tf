variable "hub" {
  description = "Hub VNet configuration"
  type = map(object({
    vnet_name       = string
    location        = string
    rg_name         = string
    address_space   = list(string)
    firewall_subnet = list(string)
  }))
}