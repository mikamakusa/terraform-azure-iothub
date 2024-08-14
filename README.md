## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.115.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.115.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_iothub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/iothub) | resource |
| [azurerm_iothub_certificate.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/iothub_certificate) | resource |
| [azurerm_eventhub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub) | data source |
| [azurerm_eventhub_authorization_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub_authorization_rule) | data source |
| [azurerm_eventhub_namespace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub_namespace) | data source |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_container) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_eventhub_authorization_rule_name"></a> [eventhub\_authorization\_rule\_name](#input\_eventhub\_authorization\_rule\_name) | n/a | `string` | `null` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | n/a | `string` | `null` | no |
| <a name="input_eventhub_namespace_name"></a> [eventhub\_namespace\_name](#input\_eventhub\_namespace\_name) | n/a | `string` | `null` | no |
| <a name="input_iothub"></a> [iothub](#input\_iothub) | n/a | <pre>list(object({<br>    id                           = number<br>    name                         = string<br>    local_authentication_enabled = optional(bool)<br>    event_hub_partition_count    = optional(number)<br>    event_hub_retention_in_days  = optional(number)<br>    sku_name                     = string<br>    sku_capacity                 = string<br>    identity_type                = optional(string)<br>    identity_ids                 = optional(list(string))<br>    endpoint = optional(list(object({<br>      type                       = optional(string)<br>      name                       = optional(string)<br>      authentication_type        = optional(string)<br>      identity_id                = optional(string)<br>      endpoint_uri               = optional(string)<br>      entity_path                = optional(string)<br>      file_name_format           = optional(string)<br>      resource_group_name        = optional(string)<br>      batch_frequency_in_seconds = optional(number)<br>      max_chunk_size_in_bytes    = optional(number)<br>      encoding                   = optional(string)<br>    })))<br>    network_rule_set = optional(list(object({<br>      default_action                     = optional(string)<br>      apply_to_builtin_eventhub_endpoint = optional(bool)<br>      ip_rule_name                       = optional(string)<br>      ip_rule_mask                       = optional(string)<br>    })))<br>    route = optional(list(object({<br>      name           = optional(string)<br>      source         = optional(string)<br>      condition      = optional(string)<br>      endpoint_names = optional(list(string))<br>      enabled        = optional(bool)<br>    })))<br>    enrichment = optional(list(object({<br>      key            = string<br>      value          = string<br>      endpoint_names = string<br>    })))<br>    fallback_route = optional(list(object({<br>      source         = optional(string)<br>      condition      = optional(string)<br>      enabled        = optional(bool)<br>      endpoint_names = optional(list(string))<br>    })))<br>    file_upload = optional(list(object({<br>      connection_string   = string<br>      container_name      = string<br>      authentication_type = optional(string)<br>      identity_id         = optional(string)<br>      sas_ttl             = optional(string)<br>      notifications       = optional(bool)<br>      lock_duration       = optional(string)<br>      default_ttl         = optional(string)<br>      max_delivery_count  = optional(number)<br>    })))<br>    cloud_to_device = optional(list(object({<br>      max_delivery_count          = optional(number)<br>      default_ttl                 = optional(string)<br>      feedback_time_to_live       = optional(string)<br>      feedback_max_delivery_count = optional(number)<br>      feedback_lock_duration      = optional(string)<br>    })))<br>  }))</pre> | `[]` | no |
| <a name="input_iothub_certificate"></a> [iothub\_certificate](#input\_iothub\_certificate) | n/a | <pre>list(object({<br>    id                  = number<br>    certificate_content = string<br>    iothub_id           = any<br>    name                = string<br>    is_verified         = optional(bool)<br>  }))</pre> | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | `null` | no |
| <a name="input_storage_container_name"></a> [storage\_container\_name](#input\_storage\_container\_name) | n/a | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iothub_certificate_content"></a> [iothub\_certificate\_content](#output\_iothub\_certificate\_content) | n/a |
| <a name="output_iothub_certificate_id"></a> [iothub\_certificate\_id](#output\_iothub\_certificate\_id) | n/a |
| <a name="output_iothub_certificate_is_verified"></a> [iothub\_certificate\_is\_verified](#output\_iothub\_certificate\_is\_verified) | n/a |
| <a name="output_iothub_certificate_name"></a> [iothub\_certificate\_name](#output\_iothub\_certificate\_name) | n/a |
| <a name="output_iothub_id"></a> [iothub\_id](#output\_iothub\_id) | n/a |
| <a name="output_iothub_name"></a> [iothub\_name](#output\_iothub\_name) | n/a |
| <a name="output_iothub_sku"></a> [iothub\_sku](#output\_iothub\_sku) | n/a |
