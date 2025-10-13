# vpc

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 7.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 7.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_network.my_vpc](https://registry.terraform.io/providers/hashicorp/google/7.5.0/docs/resources/compute_network) | resource |
| [google_compute_router.router](https://registry.terraform.io/providers/hashicorp/google/7.5.0/docs/resources/compute_router) | resource |
| [google_compute_router_nat.nat](https://registry.terraform.io/providers/hashicorp/google/7.5.0/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.bastion_subnet](https://registry.terraform.io/providers/hashicorp/google/7.5.0/docs/resources/compute_subnetwork) | resource |
| [google_compute_subnetwork.db_subnet](https://registry.terraform.io/providers/hashicorp/google/7.5.0/docs/resources/compute_subnetwork) | resource |
| [google_compute_subnetwork.node_subnet](https://registry.terraform.io/providers/hashicorp/google/7.5.0/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | gcp project id | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | gcp region | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_subnet"></a> [bastion\_subnet](#output\_bastion\_subnet) | bastion subnet |
| <a name="output_bastion_subnet_cidr"></a> [bastion\_subnet\_cidr](#output\_bastion\_subnet\_cidr) | CIDR range of the bastion subnet |
| <a name="output_db_subnet"></a> [db\_subnet](#output\_db\_subnet) | db subnet |
| <a name="output_node_subnet"></a> [node\_subnet](#output\_node\_subnet) | node subnet |
| <a name="output_node_subnet_cidr"></a> [node\_subnet\_cidr](#output\_node\_subnet\_cidr) | CIDR range of the node subnet |
| <a name="output_vpc_network"></a> [vpc\_network](#output\_vpc\_network) | output of vpc |
<!-- END_TF_DOCS -->
