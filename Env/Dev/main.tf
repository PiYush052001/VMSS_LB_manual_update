

module "rg_mod" {
  source       = "../../Modules/Module_rg"
  rg_infra_dev = var.rg_infra_main

}

module "vnet_mod" {
  depends_on   = [module.rg_mod]
  source       = "../../Modules/Module_vnet"
  vnet_alz_mod = var.vnet_alz_dev

}

module "subent_mod" {
  depends_on     = [module.rg_mod, module.vnet_mod]
  source         = "../../Modules/module_subnet"
  subnet_alz_mod = var.subnet_alz_dev

}

module "vmss_infra" {
  depends_on = [module.subent_mod , module.LB_mode]
  source     = "../../Modules/Module_VMSS"

}

module "pip_mod" {
  depends_on = [module.rg_mod]
  source     = "../../Modules/Module_pip"

}

module "LB_mode" {
  depends_on = [module.rg_mod, module.pip_mod, module.vnet_mod, module.subent_mod]
  source     = "../../Modules/Module_LB"

}