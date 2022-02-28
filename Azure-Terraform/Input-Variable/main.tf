resource "azurerm_app_service_plan" "asp" {
  count = length(var.variable_list)
  names = var.variable_list[count.index]
}

# length function to calculate length of a list
# count.index will find the current index of the loop

