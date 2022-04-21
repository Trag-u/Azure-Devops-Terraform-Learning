provider "azurerm" {
    version = "3.1.0"
    features {
      
    }
}
resource "azurerm_resource_group" "tf_nauka" {
    name = "tfmain"
    location = "West Europe"
  
}

resource "azurerm_container_group" "tfcg_test" {
    name = "weatherapi"
    location = azurerm_resource_group.tf_nauka.location
    resource_group_name = azurerm_resource_group.tf_nauka.name

    ip_address_type = "Public"
    dns_name_label = "tragu11"
    os_type = "Linux"

    container {
      name = "weatherapi"
      image = "tragu11/weatherapi"
        cpu = "1"
        memory = "1"
        ports {
          port = 80
          protocol = "TCP"
        }
    }
}

