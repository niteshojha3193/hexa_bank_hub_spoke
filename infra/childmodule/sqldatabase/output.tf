output "sql_database_ids" {
  description = "SQL Database IDs"
  value = {
    for k, v in azurerm_mssql_database.sqldb :
    k => v.id
  }
}

output "sql_database_names" {
  description = "SQL Database Names"
  value = {
    for k, v in azurerm_mssql_database.sqldb :
    k => v.name
  }
}