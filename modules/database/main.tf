resource "azurerm_mssql_server" "sql_server" {
  name                         = "todo-sql-${random_string.suffix.result}"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_database" "sql_db" {
  name      = "todo-db"
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = "Basic" # Rẻ nhất (~$5/tháng)
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_mssql_virtual_network_rule" "sql_vnet_rule" {
  name      = "sql-vnet-rule"
  server_id = azurerm_mssql_server.sql_server.id
  subnet_id = var.subnet_id
}