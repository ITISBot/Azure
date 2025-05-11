# Route Table for VNet1 Subnet
resource "azurerm_route_table" "vnet1_route_table" {
  name                = "vnet1-route-table"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Route to VNet2 Subnet
resource "azurerm_route" "vnet1_to_vnet2" {
  name                   = "to-vnet2"
  resource_group_name    = azurerm_resource_group.rg.name
  route_table_name       = azurerm_route_table.vnet1_route_table.name
  address_prefix         = "10.2.0.0/16" # VNet2 address space
  next_hop_type          = "VirtualNetworkPeering"
}

# Associate Route Table with VNet1 Subnet
resource "azurerm_subnet_route_table_association" "vnet1_assoc" {
  subnet_id      = azurerm_subnet.vnet1_subnet.id
  route_table_id = azurerm_route_table.vnet1_route_table.id
}

# Route Table for VNet2 Subnet
resource "azurerm_route_table" "vnet2_route_table" {
  name                = "vnet2-route-table"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Route to VNet1 Subnet
resource "azurerm_route" "vnet2_to_vnet1" {
  name                   = "to-vnet1"
  resource_group_name    = azurerm_resource_group.rg.name
  route_table_name       = azurerm_route_table.vnet2_route_table.name
  address_prefix         = "10.1.0.0/16" # VNet1 address space
  next_hop_type          = "VirtualNetworkPeering"
}

# Associate Route Table with VNet2 Subnet
resource "azurerm_subnet_route_table_association" "vnet2_assoc" {
  subnet_id      = azurerm_subnet.vnet2_subnet.id
  route_table_id = azurerm_route_table.vnet2_route_table.id
}
