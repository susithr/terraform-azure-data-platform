terraform {
  backend "azurerm" {
    storage_account_name = "sttfstate2b5012ed1c43"
    container_name       = "tfstate"
    use_azuread_auth     = true
    use_cli              = true
  }
}