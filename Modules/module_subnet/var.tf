variable "subnet_alz_mod" {
  description = "subent requirement for the alz"
  type = map(object({
    subnet_name      = string
    name             = string
    vnet_name        = string
    address_prefixes = list(string)
  }))
}
