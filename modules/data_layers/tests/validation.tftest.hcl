mock_provider "azurerm" {}

variables {
  storage_account_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-test/providers/Microsoft.Storage/storageAccounts/sttest"
}

run "accept_valid_names" {
  command = plan

  variables {
    container_names = ["bronze", "silver", "gold", "quarantine"]
  }
}

run "reject_invalid_name" {
  command = plan

  variables {
    container_names = ["bronze", "invalid"]
  }

  expect_failures = [
    var.container_names
  ]
}

run "reject_empty_set" {
  command = plan

  variables {
    container_names = []
  }

  expect_failures = [
    var.container_names
  ]
}