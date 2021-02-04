###############################
# Security Center outputs
###############################
output "security_center_pricing_ids" {
  description = "The Security Center subscription pricing IDs list."
  value       = module.security-center.security_center_pricing_ids
}

output "security_center_contact_id" {
  description = "The Security Center contact ID."
  value       = module.security-center.security_center_contact_id
}

output "security_center_workspaces" {
  description = "The Security Center Workspaces"
  value       = module.security-center.security_center_workspaces
}
