variable "environment" {
  description = "Environment this infrastructure belongs to."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be dev, test, or prod."
  }
}

variable "storage_account_name" {
  description = "Globally unique name for the data lake storage account."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "Use 3–24 lowercase letters or numbers only."
  }
}
variable "data_layers" {
  description = "Containers used to organize the data lake."
  type        = set(string)
  default     = ["bronze", "silver", "gold"]
}