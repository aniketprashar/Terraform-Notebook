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
  location                 = azurerm_resource_group.rg.location /* if we change it to eastus2 then it will be destructive
                                                                   in nature which will delete this resource and create
                                                                   another in the new region */
  account_tier             = "Standard"
  account_replication_type = "LRS" /*  we can modify this to ZRS which will be non destructive
                                       in nature so it can be easily modified without deleting the resource */
}

/* If we want to delete any resource like storage account then just comment out that resource block, then apply the changes. */
