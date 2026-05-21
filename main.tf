resource "azurerm_resource_group" "learning_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "learning_vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.learning_rg.name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "appgw_subnet" {
  name                 = "appgw-subnet"
  resource_group_name  = azurerm_resource_group.learning_rg.name
  virtual_network_name = azurerm_virtual_network.learning_vnet.name
  address_prefixes     = ["10.0.1.0/26"]
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-subnet"
  resource_group_name  = azurerm_resource_group.learning_rg.name
  virtual_network_name = azurerm_virtual_network.learning_vnet.name
  address_prefixes     = ["10.0.2.0/27"]
}

resource "azurerm_subnet" "db_subnet" {
  name                 = "db-subnet"
  resource_group_name  = azurerm_resource_group.learning_rg.name
  virtual_network_name = azurerm_virtual_network.learning_vnet.name
  address_prefixes     = ["10.0.3.0/27"]
}