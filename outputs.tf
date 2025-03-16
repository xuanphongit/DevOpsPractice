output "aks_cluster_name" {
  value = module.aks.aks_cluster_name
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "sql_server_fqdn" {
  value = module.sql.sql_server_fqdn
}

output "sql_connection_string" {
  value     = module.sql.connection_string
  sensitive = true
}
