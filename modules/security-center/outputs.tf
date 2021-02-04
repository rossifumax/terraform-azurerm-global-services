output "security_center_pricing_ids" {
  description = "The Security Center subscription pricing IDs list."
  value       = [for p in azurerm_security_center_subscription_pricing.pricing : p.id]
}

output "security_center_contact_id" {
  description = "The Security Center contact ID."
  value       = azurerm_security_center_contact.contact.id
}

output "security_center_workspaces" {
  description = "The Security Center Workspaces"
  value       = azurerm_security_center_workspace.security_workspace
}
