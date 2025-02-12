module "server_module" {
	source = "./server-module"
	rg_name = data.azurerm_resource_group.example.name
	location = data.azurerm_resource_group.example.location

	app_name = "portfolio-site"
	app_repository = "https://github.com/avonbied/avonbied.github.io"
	os_type = "windows"
}