locals {
  common_tags = {
    environment = var.environment
    project     = "terraform-learning"
    managed_by  = "terraform"
    purpose     = "data-engineering"
  }
}