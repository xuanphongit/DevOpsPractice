resource "azurerm_container_registry" "acr" {
  name                = "todoacr${random_string.suffix.result}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic" # Rẻ nhất
  admin_enabled       = true
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}