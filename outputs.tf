output "contact_id" {
  description = "The Security Center Contact ID. "
  value       = "${azurerm_security_center_contact.contact.id}"
}

output "security_center_workspace_id" {
  description = "The Security Center Workspace ID. "
  value       = "${azurerm_security_center_workspace.security_workspace.*.id}"
}
