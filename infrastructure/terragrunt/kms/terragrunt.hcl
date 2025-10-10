terraform {
  source = "../../terraform/modules/kms/"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true # include variables of parents file
}


dependency "gke" {
  config_path = "../gke"
  mock_outputs = {
    registry_key = "mock-kms-output"
  }
}

inputs = {
  sa_node_pool = dependency.gke.outputs.sa_node_pool
}
