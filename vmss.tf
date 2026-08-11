resource "azurerm_orchestrated_virtual_machine_scale_set" "vmss" {
  name                        = "vmss-example"
  resource_group_name         = azurerm_resource_group.rg.name
  location                    = azurerm_resource_group.rg.location
  sku_name                    = "Standard_D2as_v7"
  instances                   = 2
  platform_fault_domain_count = 1

  os_profile {
    linux_configuration {
      disable_password_authentication = false
      admin_username                  = "<admin-username>"
      admin_password                  = "<admin-password>"
    }
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Premium_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name                          = "nic"
    primary                       = true
    enable_accelerated_networking = false

    ip_configuration {
      name      = "ipconfig"
      primary   = true
      subnet_id = azurerm_subnet.subnet.id

      load_balancer_backend_address_pool_ids = [
        azurerm_lb_backend_address_pool.bepool.id
      ]
    }
  }

  boot_diagnostics {
    storage_account_uri = ""
  }

  lifecycle {
    ignore_changes = [
      instances
    ]
  }
}
