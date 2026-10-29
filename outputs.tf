output "resource_group_name" {
  description = "Name of the data platform resource group."
  value       = azurerm_resource_group.data_platform.name
}

output "resource_group_id" {
  description = "Azure resource ID of the resource group."
  value       = azurerm_resource_group.data_platform.id
}

output "resource_group_location" {
  description = "Azure region of the resource group."
  value       = azurerm_resource_group.data_platform.location
}

output "deployment_subscription_id" {
  description = "Subscription used by the AzureRM provider."
  value       = data.azurerm_client_config.current.subscription_id
}
output "data_lake_containers" {
  value = module.data_layers.container_names
}