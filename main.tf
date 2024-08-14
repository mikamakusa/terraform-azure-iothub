resource "azurerm_iothub" "this" {
  count                        = length(var.iothub)
  location                     = data.azurerm_resource_group.this.location
  name                         = lookup(var.iothub[count.index], "name")
  resource_group_name          = data.azurerm_resource_group.this.name
  local_authentication_enabled = lookup(var.iothub[count.index], "local_authentication_enabled")
  event_hub_partition_count    = lookup(var.iothub[count.index], "event_hub_partition_count")
  event_hub_retention_in_days  = lookup(var.iothub[count.index], "event_hub_retention_in_days")

  dynamic "sku" {
    for_each = (lookup(var.iothub[count.index], "sku_capacity") != null && lookup(var.iothub[count.index], "sku_name") != null) ? ["sku"] : []
    content {
      capacity = lookup(var.iothub[count.index], "sku_capacity")
      name     = lookup(var.iothub[count.index], "sku_name")
    }
  }

  dynamic "cloud_to_device" {
    for_each = ""
    content {}
  }

  dynamic "endpoint" {
    for_each = lookup(var.iothub[count.index], "endpoint") == null ? [] : ["endpoint"]
    content {
      type                       = lookup(endpoint.value, "type")
      name                       = lookup(endpoint.value, "name")
      authentication_type        = lookup(endpoint.value, "authentication_type")
      identity_id                = lookup(endpoint.value, "identity_id")
      endpoint_uri               = (lookup(endpoint.value, "authentication_type") == "identityBased" || lookup(endpoint.value, "endpoint_type") == "AzureIotHub.ServiceBusQueue" || lookup(endpoint.value, "endpoint_type") == "AzureIotHub.ServiceBusTopic" || lookup(endpoint.value, "endpoint_type") == "AzureIotHub.EventHub") ? lookup(endpoint.value, "endpoint_uri") : null
      entity_path                = (lookup(endpoint.value, "authentication_type") == "identityBased" || lookup(endpoint.value, "endpoint_type") == "AzureIotHub.ServiceBusQueue" || lookup(endpoint.value, "endpoint_type") == "AzureIotHub.ServiceBusTopic" || lookup(endpoint.value, "endpoint_type") == "AzureIotHub.EventHub") ? lookup(endpoint.value, "entity_path") : null
      connection_string          = lookup(endpoint.value, "type") == "AzureIotHub.EventHub" ? data.azurerm_eventhub_authorization_rule.this.primary_connection_string : lookup(endpoint.value, "type") == "AzureIotHub.StorageContainer" ? data.azurerm_storage_account.this.primary_blob_connection_string : null
      container_name             = lookup(endpoint.value, "type") == "AzureIotHub.StorageContainer" ? data.azurerm_storage_container.this.name : null
      file_name_format           = lookup(endpoint.value, "file_name_format")
      resource_group_name        = lookup(endpoint.value, "resource_group_name")
      batch_frequency_in_seconds = lookup(endpoint.value, "batch_frequency_in_seconds")
      max_chunk_size_in_bytes    = lookup(endpoint.value, "max_chunk_size_in_bytes")
      encoding                   = lookup(endpoint.value, "type") == "AzureIotHub.StorageContainer" ? lookup(endpoint.value, "encoding") : null
    }
  }

  dynamic "enrichment" {
    for_each = lookup(var.iothub[count.index], "enrichment") != null ? [] : ["enrichment"]
    content {
      key            = lookup(enrichment.value, "key")
      value          = lookup(enrichment.value, "value")
      endpoint_names = lookup(enrichment.value, "endpoint_names")
    }
  }

  dynamic "fallback_route" {
    for_each = lookup(var.iothub[count.index], "fallback_route") != null ? [] : ["fallback_route"]
    content {
      source         = lookup(fallback_route.value, "source", "DeviceMessages")
      condition      = lookup(fallback_route.value, "condition")
      enabled        = lookup(fallback_route.value, "enabled")
      endpoint_names = lookup(fallback_route.value, "endpoint_names")
    }
  }

  dynamic "file_upload" {
    for_each = lookup(var.iothub[count.index], "file_upload") != null ? [] : ["file_upload"]
    content {
      connection_string   = lookup(file_upload.value, "connection_string")
      container_name      = lookup(file_upload.value, "container_name")
      authentication_type = lookup(file_upload.value, "authentication_type", "keyBased")
      identity_id         = lookup(file_upload.value, "identity_id")
      sas_ttl             = lookup(file_upload.value, "sas_ttl", "PT1H")
      notifications       = lookup(file_upload.value, "notifications", false)
      lock_duration       = lookup(file_upload.value, "lock_duration", "PT1M")
      default_ttl         = lookup(file_upload.value, "default_ttl", "PT1H")
      max_delivery_count  = lookup(file_upload.value, "max_delivery_count", 10)
    }
  }

  dynamic "identity" {
    for_each = lookup(var.iothub[count.index], "identity_type") != null ? ["identity"] : []
    content {
      type         = lookup(var.iothub[count.index], "identity_type")
      identity_ids = [lookup(var.iothub[count.index], "identity_ids")]
    }
  }

  dynamic "network_rule_set" {
    for_each = lookup(var.iothub[count.index], "network_rule_set") == null ? [] : ["network_rule_set"]
    content {
      default_action                     = lookup(network_rule_set.value, "default_action")
      apply_to_builtin_eventhub_endpoint = lookup(network_rule_set.value, "apply_to_builtin_eventhub_endpoint")

      dynamic "ip_rule" {
        for_each = (lookup(network_rule_set.value, "ip_rule_mask") != null && lookup(network_rule_set.value, "ip_rule_name") != null) ? ["ip_rule"] : []
        content {
          ip_mask = lookup(network_rule_set.value, "ip_rule_mask")
          name    = lookup(network_rule_set.value, "ip_rule_name")
          action  = "Allow"
        }
      }
    }
  }

  dynamic "route" {
    for_each = lookup(var.iothub[count.index], "route") == null ? [] : ["route"]
    content {
      name           = lookup(route.value, "name")
      source         = lookup(route.value, "source")
      condition      = lookup(route.value, "condition")
      endpoint_names = lookup(route.value, "endpoint_names")
      enabled        = lookup(route.value, "enabled")
    }
  }

  dynamic "cloud_to_device" {
    for_each = lookup(var.iothub[count.index], "cloud_to_device") == null ? [] : ["cloud_to_device"]
    content {
      max_delivery_count = lookup(cloud_to_device.value, "max_delivery_count", 10)
      default_ttl        = lookup(cloud_to_device.value, "default_ttl", "PT1H")

      dynamic "feedback" {
        for_each = (lookup(cloud_to_device[count.index], "feedabck_time_to_live") != null || lookup(cloud_to_device[count.index], "feedabck_max_delivery_count") != null || lookup(cloud_to_device[count.index], "feedabck_lock_duration") != null) ? ["feedback"] : []
        content {
          time_to_live       = lookup(cloud_to_device[count.index], "feedabck_time_to_live", "PT1H")
          max_delivery_count = lookup(cloud_to_device[count.index], "feedabck_max_delivery_count", 100)
          lock_duration      = lookup(cloud_to_device[count.index], "feedabck_lock_duration", "PT60S")
        }
      }
    }
  }
}

resource "azurerm_iothub_certificate" "this" {
  count               = length(var.iothub) == 0 ? 0 : length(var.iothub_certificate)
  certificate_content = filebase64(join("/", [path.cwd, "certificate", lookup(var.iothub_certificate[count.index], "certificate_content")]))
  iothub_name         = try(element(azurerm_iothub.this.*.name, lookup(var.iothub_certificate[count.index], "iothub_id")))
  name                = lookup(var.iothub_certificate[count.index], "name")
  resource_group_name = data.azurerm_resource_group.this.name
  is_verified         = lookup(var.iothub_certificate[count.index], "is_verified")
}