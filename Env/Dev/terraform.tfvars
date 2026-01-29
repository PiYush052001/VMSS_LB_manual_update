
rg_infra_main = {
  "rg1" = {
    name       = "rg-alz-core-prod"
    location   = "east us"
    managed_by = "Hashi corp"
  }
}

vnet_alz_dev = {
  "vnet1" = {
    vnet_name     = "vnet-alz-core-prod"
    address_space = ["10.0.0.0/16"]
    vnet_location = "east us"
    name          = "rg-alz-core-prod"

  }
}

subnet_alz_dev = {
  "subnet1" = {
    subnet_name      = "subnet-alz-core-prod"
    name             = "rg-alz-core-prod"
    vnet_name        = "vnet-alz-core-prod"
    address_prefixes = ["10.0.1.0/24"]

  }
}
