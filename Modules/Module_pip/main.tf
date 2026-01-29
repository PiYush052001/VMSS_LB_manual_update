resource "azurerm_public_ip" "Lb_lz" {
  name                = "PublicIPForLB"
  location            = "east us"
  resource_group_name = "rg-alz-core-prod"
  allocation_method   = "Static"
}