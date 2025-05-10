provider "azurerm" {
  features {}
}

# Resource Group (shared for both VNet and VM)
resource "azurerm_resource_group" "rg" {
  name     = "example-resource-group"
  location = "West Europe" # Change to your desired region
}

# Include VNet and VM configurations
module "vnet" {
  source = "./vnet.tf"
}

module "vm" {
  source = "./vm.tf"
}
