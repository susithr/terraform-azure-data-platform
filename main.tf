terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}

  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "data_platform" {
  name     = "rg-data-platform-dev"
  location = "eastus"

  tags = local.common_tags
}
