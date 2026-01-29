resource "azurerm_virtual_machine_scale_set" "infra_vmss" {
  name                = "mytestscaleset-1"
  location            = "east us"
  resource_group_name = "rg-alz-core-prod"

  # automatic rolling upgrade
  automatic_os_upgrade = false
  upgrade_policy_mode  = "Manual"

# #   rolling_upgrade_policy {
# #     max_batch_instance_percent              = 20
# #     max_unhealthy_instance_percent          = 20
# #     max_unhealthy_upgraded_instance_percent = 5
# #     pause_time_between_batches              = "PT0S"
# #   }

#   # required when using rolling upgrade policy
#   health_probe_id = azurerm_lb_probe.example.id

  sku {
    name     = "Standard_F2"
    tier     = "Standard"
    capacity = 2
  }

  storage_profile_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  storage_profile_os_disk {
    name              = ""
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_profile_data_disk {
    lun           = 0
    caching       = "ReadWrite"
    create_option = "Empty"
    disk_size_gb  = 10
  }

  os_profile {
  computer_name_prefix = "testvm"
  admin_username       = "myadmin"
  admin_password       = "Mcqueen@9898!"
}

os_profile_linux_config {
  disable_password_authentication = false
}
 


  network_profile {
    name    = "terraformnetworkprofile"
    primary = true

    ip_configuration {
      name                                   = "TestIPConfiguration"
      primary                                = true
      subnet_id                              = data.azurerm_subnet.subnet_lz.id
      load_balancer_backend_address_pool_ids = [data.azurerm_lb_backend_address_pool.data_backend_pool_lb.id]
    #   load_balancer_inbound_nat_rules_ids    = [azurerm_lb_nat_pool.lbnatpool.id]
    }
  }

}

