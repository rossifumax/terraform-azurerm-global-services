output "security_center_pricing_id" {
  description = "The Security Center subscription pricing ID."
  value       = azurerm_security_center_subscription_pricing.pricing.id
}

output "security_center_contact_id" {
  description = "The Security Center contact ID."
  value       = azurerm_security_center_contact.contact.id
}

output "security_center_workspaces_ids" {
  description = "The Security Center Workspaces IDs."
  value       = azurerm_security_center_workspace.security_workspace[*].id
}
