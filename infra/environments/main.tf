module "rg" {
  source = "../childmodule/rg"
  rg     = var.rg
}

module "hub" {
  depends_on = [ module.rg ]
  source = "../childmodule/hub"
  hub    = var.hub
}

module "spoke" {
  depends_on = [ module.rg ] [module.spoke]
  source = "../childmodule/spoke"
  spoke  = var.spoke
  location = var.location
  rg_name = var.rg_name
  subnet_id = module.hub.firewall_subnet_ids["hub1"]
}

module "acr" {
  depends_on = [module.rg]
  source     = "../childmodule/ACR"
  acr        = var.acr
}

module "acr_private_endpoint" {
  depends_on = [module.acr, module.spoke]

  source    = "../childmodule/private_endpoint"
  acr_ids   = module.acr.acr_ids
  subnet_id = module.spoke.aks_subnet_ids["spoke1"]
  location  = var.location
  rg_name   = var.rg_name
}

module "sqlserver" {
  depends_on = [module.rg]
  source     = "../childmodule/sql server"
  sqlserver  = var.sqlserver
}

module "sqldatabase" {
  depends_on = [module.sqlserver]
  source     = "../childmodule/sqldatabase"
  sqldb      = var.sqldb
}

module "kv" {
  depends_on = [module.rg]
  source     = "../childmodule/keyvault"
  kv         = var.kv
}

module "peering" {
  depends_on = [module.hub, module.spoke]
  source     = "../childmodule/peering"
  peering    = var.peering
}

module "firewall" {
  depends_on = [module.hub]
  source     = "../childmodule/firewall"
  firewall   = var.firewall
}

module "route_table" {
  depends_on = [module.firewall, module.spoke]
  source     = "../childmodule/routetable"
  routetable = var.routetable
}

module "appgw" {
  depends_on = [module.spoke]
  source     = "../childmodule/appgw"
  appgw      = var.appgw
}

module "aks" {
  depends_on = [module.spoke, module.appgw]

  source     = "../childmodule/AKS"
  aks        = var.aks
  subnet_id  = module.spoke.aks_subnet_ids["spoke1"]
  appgw_subnet_id = module.spoke.appgw_subnet_ids["spoke1"]
}

module "monitoring" {
  depends_on = [module.aks]

  source     = "../childmodule/log_analytics"
  monitoring = var.monitoring
}