resource "azurerm_security_center_subscription_pricing" "pricing" {
  for_each = toset(var.security_center_pricing_resource_types)

  tier          = var.security_center_pricing_tier
  resource_type = each.value
}

resource "azurerm_security_center_contact" "contact" {
  email               = var.security_center_contact_email
  phone               = var.security_center_contact_phone
  alert_notifications = var.security_center_alert_notifications
  alerts_to_admins    = var.security_center_alerts_to_admins
}

# Manages the subscription's Security Center Workspace.
resource "azurerm_security_center_workspace" "security_workspace" {
  for_each = try({ for w in var.security_center_workspaces : w.scope_id => w.workspace_id }, {})

  scope        = each.key
  workspace_id = each.value

  depends_on = [azurerm_security_center_subscription_pricing.pricing]
}
