data "azurerm_log_analytics_workspace" "workspace1" {
  name                = "workspace1-log"
  resource_group_name = "test-rg"
}

data "azurerm_log_analytics_workspace" "workspace2" {
  name                = "workspace2-log"
  resource_group_name = "test-rg"
}

data "azurerm_resource_group" "example" {
  name = "existing"
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
    workspace_id = data.azurerm_log_analytics_workspace.workspace1.id
    }, {
    scope_id     = data.azurerm_resource_group.example.id
    workspace_id = data.azurerm_log_analytics_workspace.workspace2.id
  }]
}
