resource "azurerm_data_factory_dataset_delimited_text" "bronze_orders" {
  name                = "ds_bronze_orders"
  data_factory_id     = azurerm_data_factory.pipeline_factory.id
  linked_service_name = azurerm_data_factory_linked_service_data_lake_storage_gen2.data_lake.name

  parameters = {
    file_name = "orders.csv"
  }

  azure_blob_fs_location {
    file_system = "bronze"
    path        = "sales"

    filename                 = "@dataset().file_name"
    dynamic_filename_enabled = true
  }

  column_delimiter    = ","
  row_delimiter       = "\n"
  first_row_as_header = true
  encoding            = "UTF-8"
}