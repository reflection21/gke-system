terraform {
  source = "../../terraform/modules/kms/"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true # include variables of parents file
}


dependency "iam" {
  config_path = "../iam"
  mock_outputs = {
    registry_key = "mock-kms-output"
  }
}

inputs = {
  sa_node_pool = dependency.iam.outputs.node_pool_sa
}
