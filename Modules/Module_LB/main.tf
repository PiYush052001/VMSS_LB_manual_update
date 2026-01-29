
data "azurerm_public_ip" "public_ip_az" {
  name                = "PublicIPForLB"
  resource_group_name = "rg-alz-core-prod"
}


resource "azurerm_lb" "lb_lz" {
  name                = "TestLoadBalancer"
  location            = "east us"
  resource_group_name = "rg-alz-core-prod"
  sku = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.public_ip_az.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool_lz" {
  loadbalancer_id = azurerm_lb.lb_lz.id
  name            = "first-vmss-pool"
}

resource "azurerm_lb_probe" "probe" {
  loadbalancer_id = azurerm_lb.lb_lz.id
  name            = "http-probe"
  protocol        = "Tcp"
  port            = 80
}

resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.lb_lz.id
  name                           = "http-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool_lz.id]
  probe_id                       = azurerm_lb_probe.probe.id
}

