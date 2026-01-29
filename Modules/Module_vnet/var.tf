variable "vnet_alz_mod" {
  description = "Virtual network for the landing zone"
  type = map(object({
    vnet_name = string
    address_space = list(string)
    vnet_location = string
    name          = string
  }))

}
