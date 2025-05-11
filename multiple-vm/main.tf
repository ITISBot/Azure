provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "example-resource-group"
  location = "West Europe"
}

# VNet Module
module "vnet" {
  source = "./vnet.tf"
}

# Define the VMs to be created
variable "vm_list" {
  default = [
    {
      name          = "prod-vm"
      subnet_id     = module.vnet.prod_subnet_id
      admin_user    = "adminuser"
      admin_password = "ProdP@ssw0rd!"
    },
    {
      name          = "dev-vm"
      subnet_id     = module.vnet.dev_subnet_id
      admin_user    = "devuser"
      admin_password = "DevP@ssw0rd!"
    }
  ]
}

# VM Module
module "vm" {
  source = "./vm.tf"
  vms    = var.vm_list
}
