# Peering between hub-vnet-east and prod-vnet
resource "azurerm_virtual_network_peering" "hub_east_to_prod" {
  name                      = "hub-east-to-prod"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.hub_vnet_east.name
  remote_virtual_network_id = azurerm_virtual_network.prod_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

resource "azurerm_virtual_network_peering" "prod_to_hub_east" {
  name                      = "prod-to-hub-east"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.prod_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.hub_vnet_east.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

# Peering between hub-vnet-east and preprod-vnet
resource "azurerm_virtual_network_peering" "hub_east_to_preprod" {
  name                      = "hub-east-to-preprod"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.hub_vnet_east.name
  remote_virtual_network_id = azurerm_virtual_network.preprod_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

resource "azurerm_virtual_network_peering" "preprod_to_hub_east" {
  name                      = "preprod-to-hub-east"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.preprod_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.hub_vnet_east.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

# Peering between hub-vnet-central and dev-vnet
resource "azurerm_virtual_network_peering" "hub_central_to_dev" {
  name                      = "hub-central-to-dev"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.hub_vnet_central.name
  remote_virtual_network_id = azurerm_virtual_network.dev_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

resource "azurerm_virtual_network_peering" "dev_to_hub_central" {
  name                      = "dev-to-hub-central"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.dev_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.hub_vnet_central.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

# Peering between hub-vnet-central and lab-vnet
resource "azurerm_virtual_network_peering" "hub_central_to_lab" {
  name                      = "hub-central-to-lab"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.hub_vnet_central.name
  remote_virtual_network_id = azurerm_virtual_network.lab_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

resource "azurerm_virtual_network_peering" "lab_to_hub_central" {
  name                      = "lab-to-hub-central"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.lab_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.hub_vnet_central.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}
