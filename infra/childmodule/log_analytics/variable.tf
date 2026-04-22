
variable "monitoring" {
  type = map(object({
    workspace_name = string
    location       = string
    rg_name        = string
    aks_id         = string
  }))
}