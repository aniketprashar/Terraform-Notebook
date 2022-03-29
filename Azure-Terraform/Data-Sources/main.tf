# data sources are read only operation. The data block read data from an existing resource
# data sources are refreshed during terraform plan
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.90.0"
    }
  }
}

resource "azurerm_resource_group" "resourcegroup" {
  name     = "TFTestRG01"
  location = "CentralUS"
}

# data source block
data "azurerm_subnet" "vmsubnet" {
  name                 = var.subname
  virtual_network_name = var.vnetname
  resource_group_name  = var.vnetrg
}

module "vm" {
  source     = "./WinServer"
  rgname     = azurerm_resource_group.resourcegroup.name
  location   = azurerm_resource_group.resourcegroup.location
  vmname     = "TFTestServer"
  size       = "Standard_B2ms"
  localadmin = "locadmin"
  adminpw    = var.adminpw
  # data source being referred
  subnetid = data.azurerm_subnet.vmsubnet.id
}
