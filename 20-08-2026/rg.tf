terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.1.0"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg1" {
  name     = "reacher"
  location = "West europe"
}
resource "azurerm_storage_account" "sa" {
    depends_on = [ azurerm_resource_group.rg1 ]
  name                     = "reacherstorage1212"
  location                 = azurerm_resource_group.rg1.location
  resource_group_name      = azurerm_resource_group.rg1.name
  account_tier             = "Standard"
  account_replication_type = "GRS"
}