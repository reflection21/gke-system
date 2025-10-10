# iam

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 7.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 7.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.cluster_admin](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.gke_nodes_extra](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/project_iam_member) | resource |
| [google_service_account.bastion_host](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/service_account) | resource |
| [google_service_account.node_pool](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP Project ID where resources will be created. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP Region. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_host_sa"></a> [bastion\_host\_sa](#output\_bastion\_host\_sa) | bastion host sa |
| <a name="output_node_pool_sa"></a> [node\_pool\_sa](#output\_node\_pool\_sa) | node pool sa |
<!-- END_TF_DOCS -->
