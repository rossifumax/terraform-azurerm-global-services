resource "azurerm_security_center_subscription_pricing" "pricing" {
  tier = var.security_center_pricing_tier
}

resource "azurerm_security_center_contact" "contact" {
  email               = var.security_center_contact_email
  phone               = var.security_center_contact_phone
  alert_notifications = var.security_center_alert_notifications
  alerts_to_admins    = var.security_center_alerts_to_admins
}

# Manages the subscription's Security Center Workspace.
resource "azurerm_security_center_workspace" "security_workspace" {
  count = length(var.security_center_workspaces)

  scope        = element(keys(var.security_center_workspaces), count.index)
  workspace_id = element(values(var.security_center_workspaces), count.index)

  depends_on = [azurerm_security_center_subscription_pricing.pricing]
}

