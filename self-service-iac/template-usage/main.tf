resource "azurerm_service_plan" "example" {
	name				= "asp-iactemplate-01"
	resource_group_name	= data.azurerm_resource_group.example.name
	location			= data.azurerm_resource_group.example.location

	os_type				= "Linux"
	sku_name			= "B1"
}

resource "azurerm_linux_web_app" "example" {
	name				= "app-iactemplate-01"
	resource_group_name	= data.azurerm_resource_group.example.name
	location			= data.azurerm_resource_group.example.location
	service_plan_id		= azurerm_service_plan.example.id
	depends_on			= [ azurerm_service_plan.example ]

	public_network_access_enabled = true
	https_only = true

	site_config {
		minimum_tls_version = "1.2"
		application_stack {
			node_version = "20-lts"
		}	
	}
}

resource "azurerm_app_service_source_control" "example" {
	app_id					= azurerm_linux_web_app.example.id
	repo_url				= "https://github.com/avonbied/avonbied.github.io"
	branch					= "main"
	use_manual_integration	= true
	use_mercurial			= false
}