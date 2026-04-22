resource "azurerm_log_analytics_workspace" "log" {
  for_each = var.monitoring

  name                = each.value.workspace_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_diagnostic_setting" "aks_diag" {
  for_each = var.monitoring

  name                       = "aks-diag-${each.key}"
  target_resource_id         = each.value.aks_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log[each.key].id

  enabled_log {
    category = "kube-apiserver"
  }

  enabled_log {
    category = "kube-controller-manager"
  }

  enabled_log {
    category = "AllMetrics"
  }
}
