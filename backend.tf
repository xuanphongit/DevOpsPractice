terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstateterraform" # Ví dụ: tfstate1698765432
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}