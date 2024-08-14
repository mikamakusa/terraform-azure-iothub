data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

data "azurerm_storage_account" "this" {
  count               = var.storage_account_name ? 1 : 0
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.this.name
}

data "azurerm_storage_container" "this" {
  count                = var.storage_container_name ? 1 : 0
  name                 = var.storage_container_name
  storage_account_name = data.azurerm_storage_account.this.name
}

data "azurerm_eventhub_namespace" "this" {
  count               = var.eventhub_namespace_name ? 1 : 0
  name                = var.eventhub_namespace_name
  resource_group_name = data.azurerm_resource_group.this.name
}

data "azurerm_eventhub" "this" {
  count               = var.eventhub_name ? 1 : 0
  name                = var.eventhub_name
  namespace_name      = data.azurerm_eventhub_namespace.this.name
  resource_group_name = data.azurerm_resource_group.this.name
}

data "azurerm_eventhub_authorization_rule" "this" {
  count               = var.eventhub_authorization_rule_name ? 1 : 0
  eventhub_name       = data.azurerm_eventhub.this.name
  name                = var.eventhub_authorization_rule_name
  namespace_name      = data.azurerm_eventhub_namespace.this.name
  resource_group_name = data.azurerm_resource_group.this.name
}