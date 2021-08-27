terraform {
	required_version = ">=0.12.3"
	backend "azurerm" {
		resource_group_name  	= "__RGName__"
		storage_account_name 	= "__SAName__"
		container_name 			= "__Container__"
		key 					= "__StateName__"
		access_key 				= "__AccessKey__"
	}
}

variable "usr-resource-group-name" {}
variable "usr-location" {}
variable "usr-df-name" {}

variable "usr-subscription-id" {}
variable "usr-tenant-id" {}
variable "usr-client-id" {}
variable "usr-client-secret" {}

provider "azurerm" {
	skip_provider_registration = "true"
	features {}
	subscription_id = var.usr-subscription-id
	tenant_id 		= var.usr-tenant-id
	client_id 		= var.usr-client-id
	client_secret 	= var.usr-client-secret
}

resource "azurerm_data_factory" "data-factory" {
	name 				= var.usr-df-name
	resource_group_name = var.usr-resource-group-name
	location 			= var.usr-location
	identity {
		type = "SystemAssigned"
	}
}
