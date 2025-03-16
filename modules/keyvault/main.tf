resource "azurerm_key_vault" "kv" {
  name                        = "todo-keyvault-${random_string.suffix.result}"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  enabled_for_disk_encryption = true
  purge_protection_enabled    = false

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    secret_permissions = ["Get", "List", "Set", "Delete"]
  }
}

resource "azurerm_key_vault_secret" "sql_connection" {
  name         = "sql-connection-string"
  value        = var.sql_connection_string
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "sql_password" {
  name         = "sql-password"
  value        = var.sql_password
  key_vault_id = azurerm_key_vault.kv.id
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

data "azurerm_client_config" "current" {}