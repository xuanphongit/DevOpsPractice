output "connection_string" {
  value     = "Server=tcp:${azurerm_mssql_server.sql_server.fully_qualified_domain_name},1433;Database=${azurerm_mssql_database.sql_db.name};User Id=sqladmin;Password=${var.sql_admin_password};Encrypt=true;TrustServerCertificate=false;"
  sensitive = true
}

output "sql_server_fqdn" {
  value = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}