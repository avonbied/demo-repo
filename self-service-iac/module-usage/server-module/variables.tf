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

locals {
	vm_name = "vm${var.app_name}01"
	nic_name = "nic-${local.vm_name}-01"
	pip_name = "pip-${var.app_name}-01"
}