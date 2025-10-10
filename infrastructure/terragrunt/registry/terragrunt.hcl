terraform {
  source = "../../terraform/modules/registry/"
}


include "root" {
  path   = find_in_parent_folders()
  expose = true # include variables of parents file
}

dependency "kms" {
  config_path                             = "../kms"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    registry_key = "mock-kms-output"
  }
}

inputs = {
  registry_key = dependency.kms.outputs.registry_key
}
