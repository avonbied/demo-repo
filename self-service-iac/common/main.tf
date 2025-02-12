resource "azurerm_resource_group" "example" {
	name		= "rg-iacdemo"
	location	= "eastus"
}

resource "azurerm_virtual_network" "example" {
	resource_group_name	= azurerm_resource_group.example.name
	location			= azurerm_resource_group.example.location

	name				= "vnet-iacdemo"
	address_space		= ["10.0.0.0/16"]
}

resource "azurerm_subnet" "example" {
	resource_group_name		= azurerm_resource_group.example.name
	virtual_network_name	= azurerm_virtual_network.example.name

	name					= "subnet-iacdemo"
	address_prefixes		= ["10.0.0.0/24"]
}