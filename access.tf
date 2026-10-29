resource "azurerm_role_assignment" "data_lake_access" {
  scope                = azurerm_storage_account.data_lake.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}
resource "azurerm_role_assignment" "adf_bronze_reader" {
  scope                = module.data_layers.container_ids["bronze"]
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = azurerm_data_factory.pipeline_factory.identity[0].principal_id
  principal_type       = "ServicePrincipal"
}