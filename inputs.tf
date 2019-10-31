###############################
# Security Center variables
###############################
variable "security_center_pricing_tier" {
  description = "Manages the Pricing Tier for Azure Security Center in the current subscription. Possible values are Free and Standard. NOTE: Changing the pricing tier to Standard affects all resources in the subscription and could be quite costly. Deletion of this resource does not change or reset the pricing tier to Free. Source: https://www.terraform.io/docs/providers/azurerm/r/security_center_subscription_pricing.html"
  type        = string
  default     = "Free"
}

variable "security_center_contact_email" {
  description = "The email of the Security Center Contact. https://www.terraform.io/docs/providers/azurerm/r/security_center_contact.html#email"
  type        = string
}

variable "security_center_contact_phone" {
  description = "The phone number of the Security Center Contact. https://www.terraform.io/docs/providers/azurerm/r/security_center_contact.html#phone"
  type        = string
}

variable "security_center_alert_notifications" {
  description = "Whether to send security alerts notifications to the security contact or not. https://www.terraform.io/docs/providers/azurerm/r/security_center_contact.html#alert_notifications"
  type        = string
  default     = "true"
}

variable "security_center_alerts_to_admins" {
  description = "Whether to send security alerts notifications to subscription admins or not. https://www.terraform.io/docs/providers/azurerm/r/security_center_contact.html#alerts_to_admins"
  type        = string
  default     = "true"
}

variable "security_center_workspaces" {
  description = <<DESC
    Map of the scopes with the associated Log Analytics Workspace.
    Can only be used on \"Standard\" tier. Scope can be a Subscription or Resource Group id.
    Example {
      "/subscriptions/00000000-0000-0000-0000-000000000000" = data.azurerm_log_analytics_workspace.workspace.id
    }
    See https://www.terraform.io/docs/providers/azurerm/r/security_center_workspace.html"
DESC


  type    = map(string)
  default = {}
}

