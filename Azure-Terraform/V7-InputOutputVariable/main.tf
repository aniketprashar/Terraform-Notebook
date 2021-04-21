# using interpolation and taking values from variable file
provider "azurerm" {
  version = "~> 2.18"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.RG-Name}-01" #use of interpolation for concatination of RG name and 01 Output=AniketRG-01
  location = var.location
}
