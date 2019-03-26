variable "pricing_tier" {
  description = "Manages the Pricing Tier for Azure Security Center in the current subscription. Possible values are Free and Standard. NOTE: Changing the pricing tier to Standard affects all resources in the subscription and could be quite costly. Deletion of this resource does not change or reset the pricing tier to Free. Source: https://www.terraform.io/docs/providers/azurerm/r/security_center_subscription_pricing.html"
  type        = "string"
  default     = "Free"
}

variable "contact_email" {
  description = "The email of the Security Center Contact. https://www.terraform.io/docs/providers/azurerm/r/security_center_contact.html#email"
  type        = "string"
}

variable "contact_phone" {
  description = "The phone number of the Security Center Contact. https://www.terraform.io/docs/providers/azurerm/r/security_center_contact.html#phone"
  type        = "string"
}

variable "alert_notifications" {
  description = "Whether to send security alerts notifications to the security contact or not. https://www.terraform.io/docs/providers/azurerm/r/security_center_contact.html#alert_notifications"
  type        = "string"
  default     = "true"
}

variable "alerts_to_admins" {
  description = "Whether to send security alerts notifications to subscription admins or not. https://www.terraform.io/docs/providers/azurerm/r/security_center_contact.html#alerts_to_admins"
  type        = "string"
  default     = "true"
}

variable "scopes" {
  description = "List of scopes of VMs to send their security data to the desired workspace, unless overridden by a setting with more specific scope. Provide a scope for each of the analytics workspaces that will be linked to the security workspace. https://www.terraform.io/docs/providers/azurerm/r/security_center_workspace.html#scope"
  type        = "list"
}

variable "analytics_workspaces_ids" {
  description = "The IDs of the Log Analytics Workspaces to save the data in and to link to this security workspace. https://www.terraform.io/docs/providers/azurerm/r/security_center_workspace.html#workspace_id"
  type        = "list"
}
