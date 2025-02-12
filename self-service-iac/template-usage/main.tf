resource "azurerm_public_ip" "example" {
	resource_group_name = data.azurerm_resource_group.example.name
	location = data.azurerm_resource_group.example.location

	name = "pip-iactemplate-01"
	sku = "Standard"
	allocation_method = "Dynamic"
}

resource "azurerm_service_plan" "example" {
	name = "asp-iactemplate-01"
	resource_group_name = data.azurerm_resource_group.example.name
	location = data.azurerm_resource_group.example.location
	os_type             = "Linux"
	sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "example" {
	name                = "app-iactemplate-01"
	resource_group_name = data.azurerm_resource_group.example.name
	location = data.azurerm_resource_group.example.location
	service_plan_id     = azurerm_service_plan.example.id

	public_network_access_enabled = true

	site_config {
		minimum_tls_version = "1.2"
	}
}