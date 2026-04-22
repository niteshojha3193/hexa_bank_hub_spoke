variable "rg" {
  type = map(object({
    name     = string
    location = string
  }))

}

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





variable "acr" {
  type = map(any)
}



variable "aks" {
  description = "AKS configuration"
  type = map(object({
    aks_name       = string
    aks_location   = string
    rg_name        = string
    dns_prefix     = string
    node_pool_name = string
    node_count     = number
    vm_size        = string
    type_identity  = string
  }))
}

variable "subnet_id" {
  description = "AKS subnet ID from Spoke module"
  type        = string
}

variable "sqlserver" {
  type = map(object({
    sql_name                     = string
    rg_name                      = string
    sqlserver_location           = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
    login_username               = string
    object_id                    = string
    version                      = string

  }))
}

variable "sqldb" {
  type = map(object({
    sqldb_name     = string
    sqlserver_name = string
    rg_name        = string
  }))
}

variable "kv" {
  type = map(object({
    kv_name                     = string
    kv_location                 = string
    rg_name                     = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = string
    purge_protection_enabled    = bool
    sku_name                    = string


  }))
}

variable "rg_name" {
  description = "Resource Group Name"
  type        = string
}

variable "hub_vnet_name" {
  description = "Hub VNet Name"
  type        = string
}

variable "spoke_vnet_name" {
  description = "Spoke VNet Name"
  type        = string
}

variable "hub_vnet_id" {
  description = "Hub VNet ID"
  type        = string
}

variable "location" {
  type = string
}

variable "monitoring" {
  type = map(object({
    workspace_name = string
    location       = string
    rg_name        = string
    aks_id         = string
  }))
}

variable "peering" {
  type = map(object({
    rg_name        = string
    hub_vnet_name  = string
    spoke_vnet_name = string
    hub_vnet_id    = string
    spoke_vnet_id  = string
  }))
}

variable "firewall" {
  type = map(object({
    location  = string
    rg_name   = string
    subnet_id = string
  }))
}

variable "appgw" {
  type = map(object({
    location  = string
    rg_name   = string
    subnet_id = string
  }))
}

variable "routetable" {
  type = map(object({
    subnet_id   = string
    firewall_ip = string
    location    = string
    rg_name     = string
  }))
}