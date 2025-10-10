terraform {
  source = "../../../terraform/modules/networking/vpc/"
}


include "root" {
  path   = find_in_parent_folders()
  expose = true # include variables of parents file
}
