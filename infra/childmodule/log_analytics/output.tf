output "log_workspace_ids" {
  value = {
    for k, v in azurerm_log_analytics_workspace.log :
    k => v.id
  }
}