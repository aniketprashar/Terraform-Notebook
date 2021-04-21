/* -------------------------------------------------------- Before V14 -------------------------------------------------------- */

# provider "azurerm" {
#   version = "~> 2.18"
#   features {}
# }

# resource "azurerm_resource_group" "rg" {
#   name     = "test-rg"
#   location = "West Europe"
# }

/* --------------------------------------------------------- After V14 -------------------------------------------------------- */

terraform {
  required_providers {
    az { #az is customized name for azurerm. Any name can be used
      source  = "hashicorp/azurerm"
      version = "~>2.18"
    }
  }
}
