provider "azurerm" {
  version = "~> 2.18"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "Terra-rg"
  location = "West Europe"
}
/* Let's say that we have a storage account in the RG already created and we want to import it to the terraform state
file so that it can be managed by terraform. */

resource "azurerm_storage_account" "sa01" {
  # leave it blank before running import command
}

/* now run terraform Import command
`terraform import azurerm_storage_account.sa01 {storage account resource id to be imported}`
Now, run `terraform plan` - It will show error that arguments missing from sa01 resource block
All the missing arguments can be taken from terraform state file and filled manually in the resource block */

/* ------------------------------------------------------- Data Sources ------------------------------------------------------- */

data "azurerm_client_config" "current" {

}
resource "azurerm_storage_account" "sa01" {
  tenant_id = data.azurerm_client_config.current.tenant_id
}
