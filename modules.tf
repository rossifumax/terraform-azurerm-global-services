resource "azurerm_security_center_subscription_pricing" "pricing" {
  tier = "${var.pricing_tier}"
}

resource "azurerm_security_center_contact" "contact" {
  email               = "${var.contact_email}"
  phone               = "${var.contact_phone}"
  alert_notifications = "${var.alert_notifications}"
  alerts_to_admins    = "${var.alerts_to_admins}"
}

#Manages the subscription's Security Center Workspace.
resource "azurerm_security_center_workspace" "security_workspace" {
  count        = "${length(var.analytics_workspaces_ids)}"
  scope        = "${element(var.scopes, count.index)}"
  workspace_id = "${element(var.analytics_workspaces_ids, count.index)}"
}
