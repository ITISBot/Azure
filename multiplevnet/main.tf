provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "example-resource-group"
  location = "East US"
}

# Include Hub VNets
module "hub_vnets" {
  source = "./hub_vnets.tf"
}

# Include VNet Peering
module "vnets_peering" {
  source = "./vnets_peering.tf"
}

# Include UDRs
module "udrs" {
  source = "./udr.tf"
}
