variable "rg_infra_dev" {
    description = "RG creation for the advanced landing zone"
    type = map(object({
      name = string
    location = string
    managed_by = string
    }))
  
}