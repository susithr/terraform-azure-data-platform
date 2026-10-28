resource "azurerm_storage_container" "layers" {
  for_each = var.data_layers

  name                  = each.value
  storage_account_id    = azurerm_storage_account.data_lake.id
  container_access_type = "private"
}