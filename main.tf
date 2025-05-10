provider "azurerm" {
  features {}
}

# Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "example-resource-group"
  location = "East US"
}

# Create a Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = "examplestorageacct" # Must be globally unique
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create a Blob Container
resource "azurerm_storage_container" "container" {
  name                  = "example-container"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}
