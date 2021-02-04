module "azure-regions" {
  source  = "claranet/regions/azurerm"
  version = "2.0.1"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "2.1.0"

  location    = module.azure-regions.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}


module "global-services" {
  source  = "claranet/global-services/azurerm"
  version = "2.0.2"

  security_center_contact_email = var.contact_email
  security_center_contact_phone = var.contact_phone

  # Optional
  security_center_pricing_tier           = "Standard"
  security_center_pricing_resource_types = ["StorageAccounts"]
  security_center_alert_notifications    = true
  security_center_alerts_to_admins       = true

  security_center_workspaces = {
    "/subscriptions/00000000-0000-0000-0000-000000000000"                        = azurerm_log_analytics_workspace.workspace1.id
    "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/test-rg" = azurerm_log_analytics_workspace.workspace2.id
  }
}
