terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.79.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "igormattosterraformstate"
    container_name       = "remote-state"
    key                  = "azure-vm-modulos-remotos/terraform.tfstate"
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

module "network" {
  source  = "Azure/network/azurerm"
  version = "5.2.0"
  # insert the 2 required variables here

  resource_group_name = azurerm_resource_group.resource_group.name
  use_for_each = true
  resource_group_location = var.location
  subnet_names = ["subnet-${var.environment}"]
  tags = local.common_tags
  vnet_name = "vnet-${var.environment}"
}
