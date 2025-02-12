resource "azurerm_service_plan" "example" {
	name				= local.app_plan_name
	resource_group_name	= var.rg_name
	location			= var.location

	os_type				= "Linux"
	sku_name			= "B1"
}

resource "azurerm_linux_web_app" "example" {
	count = (var.os_type == "linux" ? 1 : 0)
	depends_on			= [ azurerm_service_plan.example ]

	name				= local.app_service_name
	resource_group_name	= var.rg_name
	location			= var.location
	service_plan_id		= azurerm_service_plan.example.id

	public_network_access_enabled = true
	https_only = true

	site_config {
		minimum_tls_version = "1.2"
		application_stack {
			node_version = "20-lts"
		}	
	}
}

resource "azurerm_windows_web_app" "example" {
	count = (var.os_type == "windows" ? 1 : 0)
	depends_on			= [ azurerm_service_plan.example ]

	name				= local.app_service_name
	resource_group_name	= var.rg_name
	location			= var.location
	service_plan_id		= azurerm_service_plan.example.id

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
	app_id					= (var.os_type == "linux" ? azurerm_linux_web_app.example.id : azurerm_windows_web_app.example.id) 
	repo_url				= var.app_repository
	branch					= "main"
	use_manual_integration	= true
	use_mercurial			= false
}