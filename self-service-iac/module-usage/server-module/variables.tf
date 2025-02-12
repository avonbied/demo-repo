variable "os_type" {
	type = string
	default = "linux"
	validation {
		condition = contains(["linux", "windows"], var.os_type)
		error_message = "Enter a valid OS type"
	}
}

variable "app_name" {
	type = string
}

variable "app_repository" {
	type = string
}

variable "location" {
	type = string
}

variable "rg_name" {
	type = string
}

locals {
	name_pattern = "${var.app_name}-${substr(var.os_type,0,1)}"
	app_plan_name = "asp-${local.name_pattern}01"
	app_service_name = "app${local.name_pattern}01"
}