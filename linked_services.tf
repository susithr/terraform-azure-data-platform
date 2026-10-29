resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "data_lake" {
  name                 = "ls_data_lake"
  data_factory_id      = azurerm_data_factory.pipeline_factory.id
  url                  = azurerm_storage_account.data_lake.primary_dfs_endpoint
  use_managed_identity = true
}