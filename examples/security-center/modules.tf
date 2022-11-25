module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure_region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

resource "azurerm_log_analytics_workspace" "workspace1" {
  location            = module.azure_region.location
  name                = "law1"
  resource_group_name = module.rg.resource_group_name
  sku                 = "PerGB2018"
}

resource "azurerm_log_analytics_workspace" "workspace2" {
  location            = module.azure_region.location
  name                = "law1"
  resource_group_name = module.rg.resource_group_name
  sku                 = "PerGB2018"
}

module "global_services" {
  source  = "claranet/global-services/azurerm"
  version = "x.x.x"

  security_center_contact_email = var.contact_email
  security_center_contact_phone = var.contact_phone

  # Optional
  security_center_pricing_tier           = "Standard"
  security_center_pricing_resource_types = ["StorageAccounts"]
  security_center_alert_notifications    = true
  security_center_alerts_to_admins       = true

  security_center_workspaces = [{
    scope_id     = "/subscriptions/00000000-0000-0000-0000-000000000000"
    workspace_id = azurerm_log_analytics_workspace.workspace1.id
    }, {
    scope_id     = module.rg.resource_group_name.id
    workspace_id = azurerm_log_analytics_workspace.workspace2.id
  }]
}
