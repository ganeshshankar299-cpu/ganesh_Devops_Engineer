resource "azurerm_resource_group" "rg" {


  for_each = toset(var.rg)

  name     = each.key
  location = "central India"

}