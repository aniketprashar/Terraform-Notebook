terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.90.0"
    }
  }
}

# resource "resource_name" "local_resource_group_name" {
#  name     = "RG_name"
#  location = "RG_location"
# }

resource "azurerm_resource_group" "resourcegroup" {
  name     = "TFTestRG01"
  location = "CentralUS"
}
