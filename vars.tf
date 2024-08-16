## DATASOURCES ##

variable "resource_group_name" {
  type = string
}

variable "storage_account_name" {
  type    = string
  default = null
}

variable "storage_container_name" {
  type    = string
  default = null
}

variable "eventhub_namespace_name" {
  type    = string
  default = null
}

variable "eventhub_name" {
  type    = string
  default = null
}

variable "eventhub_authorization_rule_name" {
  type    = string
  default = null
}

## IOT HUB ##

variable "iothub" {
  type = list(object({
    id                           = number
    name                         = string
    local_authentication_enabled = optional(bool)
    event_hub_partition_count    = optional(number)
    event_hub_retention_in_days  = optional(number)
    sku_name                     = string
    sku_capacity                 = string
    identity_type                = optional(string)
    identity_ids                 = optional(list(string))
    endpoint = optional(list(object({
      type                       = optional(string)
      name                       = optional(string)
      authentication_type        = optional(string)
      identity_id                = optional(string)
      endpoint_uri               = optional(string)
      entity_path                = optional(string)
      file_name_format           = optional(string)
      resource_group_name        = optional(string)
      batch_frequency_in_seconds = optional(number)
      max_chunk_size_in_bytes    = optional(number)
      encoding                   = optional(string)
    })))
    network_rule_set = optional(list(object({
      default_action                     = optional(string)
      apply_to_builtin_eventhub_endpoint = optional(bool)
      ip_rule_name                       = optional(string)
      ip_rule_mask                       = optional(string)
    })))
    route = optional(list(object({
      name           = optional(string)
      source         = optional(string)
      condition      = optional(string)
      endpoint_names = optional(list(string))
      enabled        = optional(bool)
    })))
    enrichment = optional(list(object({
      key            = string
      value          = string
      endpoint_names = string
    })))
    fallback_route = optional(list(object({
      source         = optional(string)
      condition      = optional(string)
      enabled        = optional(bool)
      endpoint_names = optional(list(string))
    })))
    file_upload = optional(list(object({
      connection_string   = string
      container_name      = string
      authentication_type = optional(string)
      identity_id         = optional(string)
      sas_ttl             = optional(string)
      notifications       = optional(bool)
      lock_duration       = optional(string)
      default_ttl         = optional(string)
      max_delivery_count  = optional(number)
    })))
    cloud_to_device = optional(list(object({
      max_delivery_count          = optional(number)
      default_ttl                 = optional(string)
      feedback_time_to_live       = optional(string)
      feedback_max_delivery_count = optional(number)
      feedback_lock_duration      = optional(string)
    })))
  }))
  default = []

  validation {
    condition = length([
      for a in var.iothub : true if contains(["B1", "B2", "B3", "F1", "S1", "S2", "S3"], a.sku_name)
    ]) == length(var.iothub)
    error_message = "Possible values are B1, B2, B3, F1, S1, S2, and S3."
  }

  validation {
    condition = length([
      for b in var.iothub : true if contains(["SystemAssigned", "UserAssigned"], b.identity_type)
    ]) == length(var.iothub)
    error_message = "Possible values are SystemAssigned, UserAssigned."
  }

  validation {
    condition = length([
      for c in var.iothub : true if contains(["Deny", "Allow"], c.network_rule_set.default_action)
    ]) == length(var.iothub)
    error_message = "Possible values are Deny, Allow."
  }

  validation {
    condition = length([
      for d in var.iothub : true if contains(["Invalid", "DeviceMessages", "TwinChangeEvents", "DeviceLifecycleEvents", "DeviceConnectionStateEvents", "DeviceJobLifecycleEvents", "DigitalTwinChangeEvents"], d.route.source)
    ]) == length(var.iothub)
    error_message = "Possible values include: Invalid, DeviceMessages, TwinChangeEvents, DeviceLifecycleEvents, DeviceConnectionStateEvents, DeviceJobLifecycleEvents and DigitalTwinChangeEvents."
  }

  validation {
    condition = length([
      for e in var.iothub : true if contains(["Invalid", "DeviceMessages", "TwinChangeEvents", "DeviceLifecycleEvents", "DeviceConnectionStateEvents", "DeviceJobLifecycleEvents", "DigitalTwinChangeEvents"], e.fallback_route.source)
    ]) == length(var.iothub)
    error_message = "Possible values include: Invalid, DeviceMessages, TwinChangeEvents, DeviceLifecycleEvents, DeviceConnectionStateEvents, DeviceJobLifecycleEvents and DigitalTwinChangeEvents."
  }

  validation {
    condition = length([
      for f in var.iothub : true if contains(["keyBased", "identityBased"], f.file_upload.authentication_type)
    ]) == length(var.iothub)
    error_message = "Possible values are keyBased and identityBased."
  }

  validation {
    condition = length([
      for g in var.iothub : true if contains(["Avro", "AvroDeflate", "JSON"], g.endpoint.encoding)
    ]) == length(var.iothub)
    error_message = "Supported values are Avro, AvroDeflate and JSON."
  }

  validation {
    condition = length([
      for h in var.iothub : true if !contains(["events", "operationsMonitoringEvents", "fileNotifications", "$default"], h.endpoint.name)
    ]) == length(var.iothub)
    error_message = "The following names are reserved: events, operationsMonitoringEvents, fileNotifications and $default."
  }

  validation {
    condition = length([
      for i in var.iothub : true if i.cloud_to_device.max_delivery_count >= 1 && i.cloud_to_device.max_delivery_count <= 10
    ])
    error_message = "This value must be between 1 and 100."
  }

  validation {
    condition = length([
      for j in var.iothub : true if j.cloud_to_device.feedback_max_delivery_count >= 1 && j.cloud_to_device.feedback_max_delivery_count <= 100
    ])
    error_message = "This value must be between 1 and 100."
  }
}

variable "iothub_certificate" {
  type = list(object({
    id                  = number
    certificate_content = string
    iothub_id           = any
    name                = string
    is_verified         = optional(bool)
  }))
  default = []
}

variable "consumer_group" {
  type = list(object({
    id                     = number
    eventhub_endpoint_name = string
    iothub_id              = any
    name                   = string
  }))
  default = []
}