resource "azurerm_virtual_network" "vnet_alz" {
    for_each = var.vnet_alz_mod
  name                = each.value.vnet_name
  address_space       = each.value.address_space
  location            = each.value.vnet_location
  resource_group_name = each.value.name
}