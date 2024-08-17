## IOTHUB ##

output "iothub_id" {
  value = try(
    azurerm_iothub.this.*.id
  )
}

output "iothub_name" {
  value = try(
    azurerm_iothub.this.*.name
  )
}

output "iothub_sku" {
  value = try(
    azurerm_iothub.this.*.sku
  )
}

## IOTHUB CERTIFICATE ##

output "iothub_certificate_name" {
  value = try(
    azurerm_iothub_certificate.this.*.name
  )
}

output "iothub_certificate_id" {
  value = try(
    azurerm_iothub_certificate.this.*.id
  )
}

output "iothub_certificate_content" {
  value = try(
    azurerm_iothub_certificate.this.*.certificate_content
  )
}

output "iothub_certificate_is_verified" {
  value = try(
    azurerm_iothub_certificate.this.*.is_verified
  )
}

## CONSUMER GROUP ##

output "consumer_group_name" {
  value = try(
    azurerm_iothub_consumer_group.this.*.name
  )
}

output "consumer_group_id" {
  value = try(
    azurerm_iothub_consumer_group.this.*.id
  )
}

output "consumer_group_eventhub_endpoint_name" {
  value = try(
    azurerm_iothub_consumer_group.this.*.eventhub_endpoint_name
  )
}

## DEVICE UPDATE ACCOUNT ##

output "device_update_account_id" {
  value = try(
    azurerm_iothub_device_update_account.this.*.id
  )
}

output "device_update_account_name" {
  value = try(
    azurerm_iothub_device_update_account.this.*.name
  )
}

output "device_update_account_sku" {
  value = try(
    azurerm_iothub_device_update_account.this.*.sku
  )
}

## DEVICE UPDATE INSTANCE ##

output "device_update_instance_id" {
  value = try(
    azurerm_iothub_device_update_instance.this.*.id
  )
}

output "device_update_instance_name" {
  value = try(
    azurerm_iothub_device_update_instance.this.*.name
  )
}

## IOTHUB DPS ##

output "iothub_dps_id" {
  value = try(
    azurerm_iothub_dps.this.*.id
  )
}

output "iothub_dps_name" {
  value = try(
    azurerm_iothub_dps.this.*.name
  )
}