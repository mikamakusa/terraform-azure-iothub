run "setup_tests" {
  module {
    source = "./tests/setup"
  }
}

run "create_iothub" {
  command = plan

  variables {
    resource_group_name     = "rg-iothub-1"
    storage_account_name    = "iot-stor-acc-01"
    storage_container_name  = "iot-container-1"
    tags = {
      purpose = "testing"
    }
    iothub = [{
      id           = 0
      name         = "Example-IoTHub"
      sku_name     = "S1"
      sku_capacity = "1"
      endpoint = [
        {
          type                       = "AzureIotHub.StorageContainer"
          name                       = "export"
          batch_frequency_in_seconds = 60
          max_chunk_size_in_bytes    = 10485760
          encoding                   = "Avro"
          file_name_format           = "{iothub}/{partition}_{YYYY}_{MM}_{DD}_{HH}_{mm}"
        }
      ]
      route = [
        {
          name            = "export"
          source          = "DeviceMessages"
          condition       = "true"
          endpoint_names  = ["export"]
          enabled         = true
        },
        {
          name           = "export2"
          source         = "DeviceMessages"
          condition      = "true"
          endpoint_names = ["export2"]
          enabled        = true
        }
      ]
      enrichment = [
        {
          key             = "tenant"
          value           = "$twin.tags.Tenant"
          endpoint_names  = ["export", "export2"]
        }
      ]
    }]
    iothub_certificate = [{
      id                  = 0
      name                = "example"
      iothub_id           = 0
      is_verified         = true
      certificate_content = "example.cer"
    }]
  }
}