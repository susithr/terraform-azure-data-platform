output "container_names" {
  description = "Names of the containers managed by this module."
  value       = keys(azurerm_storage_container.layers)
}
output "container_ids" {
  description = "Container IDs indexed by their names."

  value = {
    for name, container in azurerm_storage_container.layers :
    name => container.id
  }
}