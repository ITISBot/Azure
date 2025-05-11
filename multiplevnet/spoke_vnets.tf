provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "example-resource-group"
  location = "East US"
}

# Hub VNet (US East)
resource "azurerm_virtual_network" "hub_vnet_east" {
  name                = "hub-vnet-east"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = azurerm_resource_group.rg.name
}

# Hub VNet (US Central)
resource "azurerm_virtual_network" "hub_vnet_central" {
  name                = "hub-vnet-central"
  address_space       = ["10.1.0.0/16"]
  location            = "Central US"
  resource_group_name = azurerm_resource_group.rg.name
}

# Prod VNet
resource "azurerm_virtual_network" "prod_vnet" {
  name                = "prod-vnet"
  address_space       = ["10.2.0.0/16"]
  location            = "East US"
  resource_group_name = azurerm_resource_group.rg.name
}

# PreProd VNet
resource "azurerm_virtual_network" "preprod_vnet" {
  name                = "preprod-vnet"
  address_space       = ["10.3.0.0/16"]
  location            = "East US"
  resource_group_name = azurerm_resource_group.rg.name
}

# Dev VNet
resource "azurerm_virtual_network" "dev_vnet" {
  name                = "dev-vnet"
  address_space       = ["10.4.0.0/16"]
  location            = "Central US"
  resource_group_name = azurerm_resource_group.rg.name
}

# Lab VNet
resource "azurerm_virtual_network" "lab_vnet" {
  name                = "lab-vnet"
  address_space       = ["10.5.0.0/16"]
  location            = "Central US"
  resource_group_name = azurerm_resource_group.rg.name
}
