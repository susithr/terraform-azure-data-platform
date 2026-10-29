resource "azurerm_data_factory_pipeline" "inspect_orders" {
  name            = "pl_inspect_orders"
  data_factory_id = azurerm_data_factory.pipeline_factory.id

  parameters = {
    file_name = "orders.csv"
  }

  activities_json = jsonencode([
    {
      name = "ReadBronzeOrders"
      type = "Lookup"
      policy = {
        timeout                = "00:10:00"
        retry                  = 1
        retryIntervalInSeconds = 30
      }
      typeProperties = {
        dataset = {
          referenceName = azurerm_data_factory_dataset_delimited_text.bronze_orders.name
          type          = "DatasetReference"

          parameters = {
            file_name = {
              value = "@pipeline().parameters.file_name"
              type  = "Expression"
            }
          }
        }

        source = {
          type = "DelimitedTextSource"

          storeSettings = {
            type      = "AzureBlobFSReadSettings"
            recursive = false
          }

          formatSettings = {
            type = "DelimitedTextReadSettings"
          }
        }

        firstRowOnly = false
      }
    }
  ])
}