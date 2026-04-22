variable "firewall" {
  type = map(object({
    location  = string
    rg_name   = string
    subnet_id = string
  }))
}