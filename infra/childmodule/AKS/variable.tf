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

variable "appgw_subnet_id" {
  type = string
}