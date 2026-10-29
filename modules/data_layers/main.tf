terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

variable "storage_account_id" {
  type = string
}

variable "container_names" {
  description = "Approved data lake containers to create."
  type        = set(string)

  validation {
    condition     = length(var.container_names) > 0
    error_message = "Provide at least one container name."
  }

  validation {
    condition = alltrue([
      for name in var.container_names :
      contains(["bronze", "silver", "gold", "quarantine"], name)
    ])

    error_message = "Container names must be bronze, silver, gold, or quarantine."
  }
}

resource "azurerm_storage_container" "layers" {
  for_each = var.container_names

  name                  = each.value
  storage_account_id    = var.storage_account_id
  container_access_type = "private"
}