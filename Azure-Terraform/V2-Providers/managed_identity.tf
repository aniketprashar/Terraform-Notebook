# If we have a VM which has managed identity enabled then we can directly use this vm to configure MSI with terraform.

provider "azurerm" {
  use_msi = true
}
