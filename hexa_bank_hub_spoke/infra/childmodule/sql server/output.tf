output "sql_server_ids" {
  description = "SQL Server IDs"
  value = {
    for k, v in azurerm_mssql_server.sqlserver :
    k => v.id
  }
}

output "sql_server_names" {
  description = "SQL Server Names"
  value = {
    for k, v in azurerm_mssql_server.sqlserver :
    k => v.name
  }
}