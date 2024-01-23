resource "azurerm_resource_group" "aks" {
  name     = "myAKSResourceGroup"
  location = "East US"
}


resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "myAKSCluster"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "myakscluster"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
    
  }


service_principal {
  client_id = "711257eb-94a1-4a34-80c1-2a8b62c8afab"
  client_secret = "THk8Q~6fJ.jhkC11EO0aQzGUKbUlTUFB0Bg2RclK"
  
}

}