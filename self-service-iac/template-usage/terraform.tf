terraform {
  	required_providers {
		azurerm = {
			source  = "hashicorp/azurerm"
			version = "~> 4.0.0"
		}
	}
	required_version = ">= 1.1.0"
}

provider "azurerm" {
	features {}
}

# Common Imports
data "azurerm_resource_group" "example" {
	name = "rg-iacdemo"
}

data "azurerm_virtual_network" "example" {
	name				= "vnet-iacdemo"
	resource_group_name	= data.azurerm_resource_group.example.name
}

data "azurerm_subnet" "example" {
	name					= "subnet-iacdemo"
	resource_group_name		= data.azurerm_resource_group.example.name
	virtual_network_name	= data.azurerm_virtual_network.example.name
}