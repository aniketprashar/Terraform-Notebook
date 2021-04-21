/* ------------------------------------------------------ Input Variable Syntax ----------------------------------------------------- */

variable "location" {}

variable "tags" {
  type = map(string)
  default = {
    Environment = "Test"
    Dept        = "Engineering"
  }
}

variable "sku" {
  default = { #without specifying type, it will identify from default values entered
    westus = "16.04-LTS"
    eastus = "18.04-LTS"
  }
}

variable "prefix" {
  type    = string
  default = "abc"
}

/* -------------------------------------------------- Output Variable Syntax -------------------------------------------------- */

output "jumpBox-IP" {
  value     = azurerm_network_interface.jbox-rg.private_ip_address
  sensative = false
}
# it will show output on the console after apply or,
# run the command terraform output
# interpolation=insertion of attribute to a variable

/* ------------------------------------------------------- Interpolation ------------------------------------------------------ */

# ${azurerm_resource_group.be-rg.name}
# as data source ${data.azurerm_resource_group.be-rg.name}

/* -------------------------------------------- Variable To Be Used In Main.tf File ------------------------------------------- */

variable "RG-Name" {
  type    = string
  default = "AniketRG"
}
variable "location" {
  type    = string
  default = "eastus2"
}
