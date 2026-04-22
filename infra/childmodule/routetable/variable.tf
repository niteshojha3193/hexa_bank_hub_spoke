variable "routetable" {
  type = map(object({
    subnet_id   = string
    firewall_ip = string
    location    = string
    rg_name     = string
  }))
}