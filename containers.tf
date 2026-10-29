module "data_layers" {
  source = "./modules/data_layers"

  storage_account_id = azurerm_storage_account.data_lake.id
  container_names    = var.data_layers
}

moved {
  from = azurerm_storage_container.layers
  to   = module.data_layers.azurerm_storage_container.layers
}