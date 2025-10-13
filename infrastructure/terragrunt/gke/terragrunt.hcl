terraform {
  source = "../../terraform/modules/gke/"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true # include variables of parents file
}

dependency "vpc" {
  config_path = "../networking/vpc"
}

dependency "iam" {
  config_path = "../iam"
}

inputs = {
  vpc_network         = dependency.vpc.outputs.vpc_network
  node_subnet          = dependency.vpc.outputs.node_subnet
  bastion_subnet_cidr = dependency.vpc.outputs.bastion_subnet_cidr
  node_subnet_cidr  = dependency.vpc.outputs.node_subnet_cidr
  node_pool_sa        = dependency.iam.outputs.node_pool_sa
}
