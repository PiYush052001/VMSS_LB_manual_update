
resource "azurerm_resource_group" "infra_rg" {
    for_each = var.rg_infra_dev
    name = each.value.name
    location = each.value.location
    managed_by = each.value.managed_by

  
}