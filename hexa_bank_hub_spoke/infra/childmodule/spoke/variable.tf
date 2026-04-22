variable "spoke" {
  description = "Spoke VNet configuration"
  type = map(object({
    vnet_name     = string
    location      = string
    rg_name       = string
    address_space = list(string)

    aks_subnet    = list(string)
    appgw_subnet  = list(string)
  }))
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "rg_name" {
  description = "Resource Group Name"
  type        = string
}

variable "subnet_id" {
  description = "Azure Firewall Subnet ID (from Hub)"
  type        = string
}