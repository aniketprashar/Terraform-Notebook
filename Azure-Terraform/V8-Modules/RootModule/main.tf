/*
Root Module:
    variable.tf
    main.tf
    output.tf

    child module calls root module:
    module {
        source="{relative_local_root_module_path}"
    }
*/

resource "azurerm_virtual_network" "dev" {
  name                = "${var.vmName}-vnet"
  address_space       = ["10.0.2.0/23"]
  location            = var.location
  resource_group_name = var.rgName
}
