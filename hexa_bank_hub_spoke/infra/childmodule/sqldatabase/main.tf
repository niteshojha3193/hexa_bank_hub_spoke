

data "azurerm_mssql_server" "sql_id" {
  for_each = var.sqldb
  name                = each.value.sqlserver_name
  resource_group_name = each.value.rg_name
}


resource "azurerm_mssql_database" "sqldb" {
  for_each = var.sqldb
  name         = each.value.sqldb_name
  server_id    = data.azurerm_mssql_server.sql_id[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = {
    foo = "bar"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}