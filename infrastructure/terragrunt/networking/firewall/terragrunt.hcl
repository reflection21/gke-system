terraform {
  source = "../../../terraform/modules/networking/firewall/"
}


include "root" {
  path   = find_in_parent_folders()
  expose = true # include variables of parents file
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  vpc_network    = dependency.vpc.outputs.vpc_network
  bastion_subnet = dependency.vpc.outputs.bastion_subnet_cidr
}
