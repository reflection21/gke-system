terraform {
  source = "../../terraform/modules/secret_manager/"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true # include variables of parents file
}
