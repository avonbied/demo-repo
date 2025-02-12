output "rg_name" {
	value = "${azurerm_resource_group.example.name}"
	depends_on = [ azurerm_resource_group.example ]
}

output "rg_id" {
	value = "${azurerm_resource_group.example.id}"
	depends_on = [ azurerm_resource_group.example ]
}