terraform {
  required_version = "> 0.12.26"

  required_providers {
    azurerm = ">= 2.31"
  }
}

resource "azurerm_log_analytics_workspace" "workspace1" {
  location            = module.azure-regions.location
  name                = var.workspace1_name
  resource_group_name = module.rg.resource_group_name
  sku                 = "PerGB2018"
}

resource "azurerm_log_analytics_workspace" "workspace2" {
  location            = module.azure-regions.location
  name                = var.workspace2_name
  resource_group_name = module.rg.resource_group_name
  sku                 = "PerGB2018"
}
