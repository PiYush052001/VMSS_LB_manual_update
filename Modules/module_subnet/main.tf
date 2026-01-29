resource "azurerm_subnet" "subnet_alz" {
    for_each = var.subnet_alz_mod
  name                 = each.value.subnet_name
  resource_group_name  = each.value.name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes

}
