provider "azurerm" {
  features {}
}

# Create VNet1 in US East
resource "azurerm_virtual_network" "vnet1" {
  name                = "hub-vnet-east"
  address_space       = ["10.1.0.0/16"]
  location            = "East US"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "vnet1_subnet" {
  name                 = "vnet1-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.1.1.0/24"]
}

# Create VNet2 in US Central
resource "azurerm_virtual_network" "vnet2" {
  name                = "hub-vnet-central"
  address_space       = ["10.2.0.0/16"]
  location            = "Central US"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "vnet2_subnet" {
  name                 = "vnet2-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["10.2.1.0/24"]
}
