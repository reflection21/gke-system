terraform {
  source = "../../../terraform/modules/networking/firewall/"
}


include "root" {
  path   = find_in_parent_folders()
  expose = true # include variables of parents file
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    vpc_network         = "mock-vpc"
    bastion_subnet_cidr = "10.0.1.0/24"
  }
}

inputs = {
  vpc_network    = dependency.vpc.outputs.vpc_network
  bastion_subnet = dependency.vpc.outputs.bastion_subnet_cidr
}
