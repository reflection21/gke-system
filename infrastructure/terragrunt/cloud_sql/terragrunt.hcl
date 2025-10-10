terraform {
  source = "../../terraform/modules/cloud_sql/"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true # include variables of parents file
}

dependency "secret_manager" {
  config_path = "../secret_manager"
  mock_outputs = {
    root_password = "mock-secret_manager-output"
  }
}

dependency "vpc" {
  config_path = "../networking/vpc"
}

inputs = {
  root_password    = dependency.secret_manager.outputs.root_password
  db_instance_name = "my-sql-84"
  vpc              = dependency.vpc.outputs.vpc_network
  db_subnet        = dependency.vpc.outputs.db_subnet
  bastion_subnet   = dependency.vpc.outputs.bastion_subnet_cidr
  worker_subnet    = dependency.vpc.outputs.worker_subnet

}
