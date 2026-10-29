resource "azurerm_data_factory" "pipeline_factory" {
  name                = "adf-${var.storage_account_name}"
  location            = azurerm_storage_account.data_lake.location
  resource_group_name = azurerm_resource_group.data_platform.name

  identity {
    type = "SystemAssigned"
  }

  tags = local.common_tags
}