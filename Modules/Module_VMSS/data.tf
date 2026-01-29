
data "azurerm_lb" "data_lb" {
  name                = "TestLoadBalancer"
  resource_group_name = "rg-alz-core-prod"
}


data "azurerm_lb_backend_address_pool" "data_backend_pool_lb" {
  name            = "first-vmss-pool"
  loadbalancer_id = data.azurerm_lb.data_lb.id
}

data "azurerm_subnet" "subnet_lz" {
  name                 = "subnet-alz-core-prod"
  virtual_network_name = "vnet-alz-core-prod"
  resource_group_name  = "rg-alz-core-prod"
}