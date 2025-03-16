resource "azurerm_kubernetes_cluster" "aks" {
  name                = "todo-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "todoaks"

  default_node_pool {
    name           = "default"
    node_count     = 1
    vm_size        = "Standard_B2s"
    vnet_subnet_id = var.vnet_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "kubenet"
    service_cidr   = "10.1.0.0/16" # Thay đổi để tránh trùng với VNet
    dns_service_ip = "10.1.0.10"   # Phải nằm trong service_cidr
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = var.acr_id
}