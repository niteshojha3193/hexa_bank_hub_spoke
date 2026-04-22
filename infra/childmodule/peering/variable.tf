variable "peering" {
  type = map(object({
    rg_name        = string
    hub_vnet_name  = string
    spoke_vnet_name = string
    hub_vnet_id    = string
    spoke_vnet_id  = string
  }))
}