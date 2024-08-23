## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.115.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.115.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_storage"></a> [storage](#module\_storage) | ./modules/terraform-azure-storage | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_iothub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/iothub) | resource |
| [azurerm_iothub_certificate.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/iothub_certificate) | resource |
| [azurerm_iothub_consumer_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/iothub_consumer_group) | resource |
| [azurerm_iothub_device_update_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/iothub_device_update_account) | resource |
| [azurerm_iothub_device_update_instance.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/iothub_device_update_instance) | resource |
| [azurerm_iothub_dps.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/iothub_dps) | resource |
| [azurerm_iothub_dps_certificate.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/iothub_dps_certificate) | resource |
| [azurerm_iothub_dps_shared_access_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/iothub_dps_shared_access_policy) | resource |
| [azurerm_eventhub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub) | data source |
| [azurerm_eventhub_authorization_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub_authorization_rule) | data source |
| [azurerm_eventhub_namespace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub_namespace) | data source |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_container) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_consumer_group"></a> [consumer\_group](#input\_consumer\_group) | n/a | <pre>list(object({<br>    id                     = number<br>    eventhub_endpoint_name = string<br>    iothub_id              = any<br>    name                   = string<br>  }))</pre> | `[]` | no |
| <a name="input_device_update_account"></a> [device\_update\_account](#input\_device\_update\_account) | n/a | <pre>list(object({<br>    id                            = number<br>    name                          = string<br>    public_network_access_enabled = optional(bool)<br>    sku                           = optional(string)<br>    tags                          = optional(map(string))<br>    identity_type                 = optional(string)<br>    identity_ids                  = optional(list(string))<br>  }))</pre> | `[]` | no |
| <a name="input_device_update_instance"></a> [device\_update\_instance](#input\_device\_update\_instance) | n/a | <pre>list(object({<br>    id                       = number<br>    device_update_account_id = any<br>    iothub_id                = any<br>    name                     = string<br>    diagnostic_enabled       = optional(bool)<br>    tags                     = optional(map(string))<br>    diagnostic_storage_account = optional(list(object({<br>      storage_account_id = any<br>    })))<br>  }))</pre> | `[]` | no |
| <a name="input_eventhub_authorization_rule_name"></a> [eventhub\_authorization\_rule\_name](#input\_eventhub\_authorization\_rule\_name) | n/a | `string` | `null` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | n/a | `string` | `null` | no |
| <a name="input_eventhub_namespace_name"></a> [eventhub\_namespace\_name](#input\_eventhub\_namespace\_name) | n/a | `string` | `null` | no |
| <a name="input_iothub"></a> [iothub](#input\_iothub) | n/a | <pre>list(object({<br>    id                           = number<br>    name                         = string<br>    local_authentication_enabled = optional(bool)<br>    event_hub_partition_count    = optional(number)<br>    event_hub_retention_in_days  = optional(number)<br>    sku_name                     = string<br>    sku_capacity                 = string<br>    identity_type                = optional(string)<br>    identity_ids                 = optional(list(string))<br>    endpoint = optional(list(object({<br>      type                       = optional(string)<br>      name                       = optional(string)<br>      authentication_type        = optional(string)<br>      identity_id                = optional(string)<br>      endpoint_uri               = optional(string)<br>      entity_path                = optional(string)<br>      file_name_format           = optional(string)<br>      resource_group_name        = optional(string)<br>      batch_frequency_in_seconds = optional(number)<br>      max_chunk_size_in_bytes    = optional(number)<br>      encoding                   = optional(string)<br>      container_id               = optional(any)<br>      storage_account_id         = optional(any)<br>    })))<br>    network_rule_set = optional(list(object({<br>      default_action                     = optional(string)<br>      apply_to_builtin_eventhub_endpoint = optional(bool)<br>      ip_rule_name                       = optional(string)<br>      ip_rule_mask                       = optional(string)<br>    })))<br>    route = optional(list(object({<br>      name           = optional(string)<br>      source         = optional(string)<br>      condition      = optional(string)<br>      endpoint_names = optional(list(string))<br>      enabled        = optional(bool)<br>    })))<br>    enrichment = optional(list(object({<br>      key            = string<br>      value          = string<br>      endpoint_names = string<br>    })))<br>    fallback_route = optional(list(object({<br>      source         = optional(string)<br>      condition      = optional(string)<br>      enabled        = optional(bool)<br>      endpoint_names = optional(list(string))<br>    })))<br>    file_upload = optional(list(object({<br>      connection_string   = string<br>      container_name      = string<br>      authentication_type = optional(string)<br>      identity_id         = optional(string)<br>      sas_ttl             = optional(string)<br>      notifications       = optional(bool)<br>      lock_duration       = optional(string)<br>      default_ttl         = optional(string)<br>      max_delivery_count  = optional(number)<br>    })))<br>    cloud_to_device = optional(list(object({<br>      max_delivery_count          = optional(number)<br>      default_ttl                 = optional(string)<br>      feedback_time_to_live       = optional(string)<br>      feedback_max_delivery_count = optional(number)<br>      feedback_lock_duration      = optional(string)<br>    })))<br>  }))</pre> | `[]` | no |
| <a name="input_iothub_certificate"></a> [iothub\_certificate](#input\_iothub\_certificate) | n/a | <pre>list(object({<br>    id                  = number<br>    certificate_content = string<br>    iothub_id           = any<br>    name                = string<br>    is_verified         = optional(bool)<br>  }))</pre> | `[]` | no |
| <a name="input_iothub_dps"></a> [iothub\_dps](#input\_iothub\_dps) | n/a | <pre>list(object({<br>    id                            = number<br>    name                          = string<br>    allocation_policy             = optional(string)<br>    data_residency_enabled        = optional(bool)<br>    public_network_access_enabled = optional(bool)<br>    sku = optional(list(object({<br>      capacity = number<br>      name     = optional(string)<br>    })))<br>    ip_filter_rule = optional(list(object({<br>      action  = string<br>      ip_mask = string<br>      name    = string<br>      target  = optional(string)<br>    })))<br>    linked_hub = optional(list(object({<br>      connection_string       = string<br>      location                = string<br>      apply_allocation_policy = optional(bool)<br>      allocation_weight       = optional(number)<br>    })))<br>  }))</pre> | `[]` | no |
| <a name="input_iothub_dps_certificate"></a> [iothub\_dps\_certificate](#input\_iothub\_dps\_certificate) | n/a | <pre>list(object({<br>    id                  = number<br>    certificate_content = string<br>    iot_dps_id          = any<br>    name                = string<br>    is_verified         = optional(bool)<br>  }))</pre> | `[]` | no |
| <a name="input_iothub_dps_shared_access_policy"></a> [iothub\_dps\_shared\_access\_policy](#input\_iothub\_dps\_shared\_access\_policy) | n/a | <pre>list(object({<br>    id                 = number<br>    iothub_dps_id      = any<br>    name               = string<br>    enrollment_read    = optional(bool)<br>    enrollment_write   = optional(bool)<br>    registration_read  = optional(bool)<br>    registration_write = optional(bool)<br>    service_config     = optional(bool)<br>  }))</pre> | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_sorage_account"></a> [sorage\_account](#input\_sorage\_account) | n/a | `any` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | `null` | no |
| <a name="input_storage_container_name"></a> [storage\_container\_name](#input\_storage\_container\_name) | n/a | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_consumer_group_eventhub_endpoint_name"></a> [consumer\_group\_eventhub\_endpoint\_name](#output\_consumer\_group\_eventhub\_endpoint\_name) | n/a |
| <a name="output_consumer_group_id"></a> [consumer\_group\_id](#output\_consumer\_group\_id) | n/a |
| <a name="output_consumer_group_name"></a> [consumer\_group\_name](#output\_consumer\_group\_name) | n/a |
| <a name="output_device_update_account_id"></a> [device\_update\_account\_id](#output\_device\_update\_account\_id) | n/a |
| <a name="output_device_update_account_name"></a> [device\_update\_account\_name](#output\_device\_update\_account\_name) | n/a |
| <a name="output_device_update_account_sku"></a> [device\_update\_account\_sku](#output\_device\_update\_account\_sku) | n/a |
| <a name="output_device_update_instance_id"></a> [device\_update\_instance\_id](#output\_device\_update\_instance\_id) | n/a |
| <a name="output_device_update_instance_name"></a> [device\_update\_instance\_name](#output\_device\_update\_instance\_name) | n/a |
| <a name="output_iothub_certificate_content"></a> [iothub\_certificate\_content](#output\_iothub\_certificate\_content) | n/a |
| <a name="output_iothub_certificate_id"></a> [iothub\_certificate\_id](#output\_iothub\_certificate\_id) | n/a |
| <a name="output_iothub_certificate_is_verified"></a> [iothub\_certificate\_is\_verified](#output\_iothub\_certificate\_is\_verified) | n/a |
| <a name="output_iothub_certificate_name"></a> [iothub\_certificate\_name](#output\_iothub\_certificate\_name) | n/a |
| <a name="output_iothub_dps_certificate_id"></a> [iothub\_dps\_certificate\_id](#output\_iothub\_dps\_certificate\_id) | n/a |
| <a name="output_iothub_dps_certificate_name"></a> [iothub\_dps\_certificate\_name](#output\_iothub\_dps\_certificate\_name) | n/a |
| <a name="output_iothub_dps_id"></a> [iothub\_dps\_id](#output\_iothub\_dps\_id) | n/a |
| <a name="output_iothub_dps_name"></a> [iothub\_dps\_name](#output\_iothub\_dps\_name) | n/a |
| <a name="output_iothub_dps_share_access_policy_id"></a> [iothub\_dps\_share\_access\_policy\_id](#output\_iothub\_dps\_share\_access\_policy\_id) | n/a |
| <a name="output_iothub_dps_share_access_policy_name"></a> [iothub\_dps\_share\_access\_policy\_name](#output\_iothub\_dps\_share\_access\_policy\_name) | n/a |
| <a name="output_iothub_id"></a> [iothub\_id](#output\_iothub\_id) | n/a |
| <a name="output_iothub_name"></a> [iothub\_name](#output\_iothub\_name) | n/a |
| <a name="output_iothub_sku"></a> [iothub\_sku](#output\_iothub\_sku) | n/a |
