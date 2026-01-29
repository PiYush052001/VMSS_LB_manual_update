variable "rg_infra_main" {
  description = "RG creation for the advanced landing zone"
  type = map(object({
    name       = string
    location   = string
    managed_by = string
  }))

}


variable "vnet_alz_dev" {
  description = "Virtual network for the landing zone"
  type = map(object({
    vnet_name     = string
    address_space = list(string)
    vnet_location = string
    name          = string
  }))

}

variable "subnet_alz_dev" {
  description = "subent requirement for the alz"
  type = map(object({
    subnet_name      = string
    name             = string
    vnet_name        = string
    address_prefixes = list(string)
  }))
}
