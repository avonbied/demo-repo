output "hostname" {
	value = (var.os_type == "linux" ? azurerm_linux_web_app.example.default_hostname : azurerm_linux_web_app.example.default_hostname)
}
