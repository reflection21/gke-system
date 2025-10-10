terraform {
  source = "../../terraform/modules/iam/"
}


include "root" {
  path   = find_in_parent_folders()
  expose = true # include variables of parents file
}
