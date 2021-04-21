resource "azurerm_resource_group" "dev" {
  name     = "test"
  location = "eastus"
}
module "dev-env" {
  source   = "../RootModule"
  rgName   = azurerm_virtual_network.dev.name
  location = azurerm_virtual_network.dev.location
  vmName   = "AniketVM"
}
# this will deploy vnet defined in root directory but with new variables hence reducing the need to copy complete code.
