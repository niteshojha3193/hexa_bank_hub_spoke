output "lb_ids" {
  description = "Load Balancer IDs"
  value = {
    for k, v in azurerm_lb.lb :
    k => v.id
  }
}

output "lb_names" {
  description = "Load Balancer Names"
  value = {
    for k, v in azurerm_lb.lb :
    k => v.name
  }
}