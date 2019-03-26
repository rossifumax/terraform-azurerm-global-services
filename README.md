# Azure Global Services

This feature attachs one or several existing log analytics workspaces to the Azure security center and configures contact infos for notifications.

## Usage

```shell

module "global-services" {
  source			= "git@git.fr.clara.net:claranet/cloudnative/projects/cloud/azure/terraform/features/global-services.git?ref=vX.X.X"

  #Mandatory
  contact_email			= "${var.contact_email}"
  contact_phone			= "${var.contact_phone}"
  scopes			= "${var.scopes}"
  analytics_workspaces_ids	= "${var.analytics_workspaces_ids}"

  #Optional
  pricing_tier			= "${var.pricing_tier}"
  alert_notifications		= "${var.alert_notifications}"
  alerts_to_admins		= "${var.alerts_to_admins}"
}

```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alert\_notifications | Whether to send security alerts notifications to the security contact or not. https://www.terraform.io/docs/providers/azurerm/r/security_center_contact.html#alert_notifications | string | `"true"` | no |
| alerts\_to\_admins | Whether to send security alerts notifications to subscription admins or not. https://www.terraform.io/docs/providers/azurerm/r/security_center_contact.html#alerts_to_admins | string | `"true"` | no |
| analytics\_workspaces\_ids | The IDs of the Log Analytics Workspaces to save the data in and to link to this security workspace. https://www.terraform.io/docs/providers/azurerm/r/security_center_workspace.html#workspace_id | list | n/a | yes |
| contact\_email | The email of the Security Center Contact. https://www.terraform.io/docs/providers/azurerm/r/security_center_contact.html#email | string | n/a | yes |
| contact\_phone | The phone number of the Security Center Contact. https://www.terraform.io/docs/providers/azurerm/r/security_center_contact.html#phone | string | n/a | yes |
| pricing\_tier | Manages the Pricing Tier for Azure Security Center in the current subscription. Possible values are Free and Standard. NOTE: Changing the pricing tier to Standard affects all resources in the subscription and could be quite costly. Deletion of this resource does not change or reset the pricing tier to Free. Source: https://www.terraform.io/docs/providers/azurerm/r/security_center_subscription_pricing.html | string | `"Free"` | no |
| scopes | List of scopes of VMs to send their security data to the desired workspace, unless overridden by a setting with more specific scope. Provide a scope for each of the analytics workspaces that will be linked to the security workspace. https://www.terraform.io/docs/providers/azurerm/r/security_center_workspace.html#scope | list | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| contact\_id | The Security Center Contact ID. |
| security\_center\_workspace\_id | The Security Center Workspace ID. |
