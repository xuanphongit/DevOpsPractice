output "aks_subnet_id" {
  value = azurerm_subnet.aks_subnet.id
}

output "sql_subnet_id" {
  value = azurerm_subnet.sql_subnet.id
}