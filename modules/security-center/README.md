# Azure Security Center

This module deploy the following Azure's feature:
 * [Azure Security Center](https://docs.microsoft.com/en-us/azure/security-center/)

## Version compatibility

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 4.x.x       | 0.13.x            | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool which set some terraform variables in the environment needed by this module.

More details about variables set by the terraform-wrapper available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
data "azurerm_log_analytics_workspace" "workspace1" {
  name                = "workspace1-log"
  resource_group_name = "test-rg"
}

data "azurerm_log_analytics_workspace" "workspace2" {
  name                = "workspace2-log"
  resource_group_name = "test-rg"
}

module "security-center" {
  source = "claranet/global-services/azurerm//modules/security-center"
  version = "x.x.x"

  security_center_contact_email = var.contact_email
  security_center_contact_phone = var.contact_phone

  # Optional
  security_center_pricing_tier           = "Standard"
  security_center_pricing_resource_types = ["StorageAccounts"]
  security_center_alert_notifications    = true
  security_center_alerts_to_admins       = true

  security_center_workspaces = {
    "/subscriptions/00000000-0000-0000-0000-000000000000"                        = data.azurerm_log_analytics_workspace.workspace1.id  
    "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/test-rg" = data.azurerm_log_analytics_workspace.workspace2.id
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.31 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_security_center_contact.contact](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_contact) | resource |
| [azurerm_security_center_subscription_pricing.pricing](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_subscription_pricing) | resource |
| [azurerm_security_center_workspace.security_workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| security\_center\_alert\_notifications | Whether to send security alerts notifications to the security contact or not. https://www.terraform.io/docs/providers/azurerm/r/security_center_contact.html#alert_notifications | `bool` | `true` | no |
| security\_center\_alerts\_to\_admins | Whether to send security alerts notifications to subscription admins or not. https://www.terraform.io/docs/providers/azurerm/r/security_center_contact.html#alerts_to_admins | `bool` | `true` | no |
| security\_center\_contact\_email | The email of the Security Center Contact. https://www.terraform.io/docs/providers/azurerm/r/security_center_contact.html#email | `string` | n/a | yes |
| security\_center\_contact\_phone | The phone number of the Security Center Contact. https://www.terraform.io/docs/providers/azurerm/r/security_center_contact.html#phone | `string` | n/a | yes |
| security\_center\_pricing\_resource\_types | List of resource type to apply the Azure Security Center pricing tier. Possible values are AppServices, ContainerRegistry, KeyVaults, KubernetesService, SqlServers, SqlServerVirtualMachines, StorageAccounts, and VirtualMachines. Source: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_subscription_pricing#resource_type | `list(string)` | <pre>[<br>  "AppServices",<br>  "ContainerRegistry",<br>  "KeyVaults",<br>  "KubernetesService",<br>  "SqlServers",<br>  "SqlServerVirtualMachines",<br>  "StorageAccounts",<br>  "VirtualMachines"<br>]</pre> | no |
| security\_center\_pricing\_tier | Manages the Pricing Tier for Azure Security Center in the current subscription. Possible values are Free and Standard. NOTE: Changing the pricing tier to Standard affects all resources in the subscription and could be quite costly. Deletion of this resource does not change or reset the pricing tier to Free. Source: https://www.terraform.io/docs/providers/azurerm/r/security_center_subscription_pricing.html | `string` | `"Standard"` | no |
| security\_center\_workspaces | Map of the scopes with the associated Log Analytics Workspace.<br>    Can only be used on `Standard` tier. Scope can be a Subscription or Resource Group ID.<br>    See https://www.terraform.io/docs/providers/azurerm/r/security_center_workspace.html" | <pre>list(object({<br>    scope_id     = string<br>    workspace_id = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| security\_center\_contact\_id | The Security Center contact ID. |
| security\_center\_pricing\_ids | The Security Center subscription pricing IDs list. |
| security\_center\_workspaces | The Security Center Workspaces |
<!-- END_TF_DOCS -->
## Related documentation

Microsoft Azure Security Center documentation: [docs.microsoft.com/en-us/azure/security-center/](https://docs.microsoft.com/en-us/azure/security-center/)
