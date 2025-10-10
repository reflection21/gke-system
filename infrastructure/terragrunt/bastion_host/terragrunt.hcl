terraform {
  source = "../../terraform/modules/bastion_host/"
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
  vpc_network    = dependency.vpc.outputs.vpc_network
  bastion_subnet = dependency.vpc.outputs.bastion_subnet
  bastion_host_sa = dependency.iam.outputs.bastion_host_sa

}
