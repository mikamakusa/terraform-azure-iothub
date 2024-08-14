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