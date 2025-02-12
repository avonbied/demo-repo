resource "azurerm_public_ip" "example" {
	resource_group_name = data.azurerm_resource_group.example.name
	location = data.azurerm_resource_group.example.location

	name = "pip-iactemplate-01"
	sku = "Standard"
	allocation_method = "Dynamic"
}

resource "azurerm_network_interface" "example" {
	resource_group_name = data.azurerm_resource_group.example.name
	location = data.azurerm_resource_group.example.location

	name = "nic-vmiactemplate01-01"

	ip_configuration {
		name = "internal"
		subnet_id = data.azurerm_subnet.example.id
		private_ip_address_allocation = "Dynamic"
		public_ip_address_id = azurerm_public_ip.example.id
	}
}

resource "azurerm_linux_virtual_machine" "example" {
	resource_group_name = data.azurerm_resource_group.example.name
	location = data.azurerm_resource_group.example.location

	name = "vm-iactemplate-01"
	size = "D2s"
	admin_username = "avonbied"
	admin_password = "C0nfirm!"

	os_disk {
		name = "vmiactemplate01-osdisk"
		caching = "None"
		storage_account_type = "Standard_LRS"
		disk_size_gb = 16
	}
	network_interface_ids = [ azurerm_network_interface.example.id ]
}