provider "azurerm" {
  version = "~> 2.18"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "Terra-rg"
  location = "West Europe"
}

resource "azurerm_key_vault" "kv" {
  name                = "keyvaukt-terra01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = "{TenantId}"
  sku_name            = "standard"
}

resource "azurerm_storage_account" "sa" {
  name                     = "storageaccount-terra01"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
