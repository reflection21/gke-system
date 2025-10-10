# gke

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
| [google_container_cluster.my_cluster](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/container_cluster) | resource |
| [google_container_node_pool.node_pool](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/container_node_pool) | resource |
| [google_project_iam_member.gke_nodes](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.gke_nodes_compute](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/project_iam_member) | resource |
| [google_service_account.node_pool](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/service_account) | resource |
| [google_compute_zones.available_zones](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/data-sources/compute_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_subnet_cidr"></a> [bastion\_subnet\_cidr](#input\_bastion\_subnet\_cidr) | bastion subnet | `string` | n/a | yes |
| <a name="input_deployment_prefix"></a> [deployment\_prefix](#input\_deployment\_prefix) | Prefix of the deployment | `string` | n/a | yes |
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP Project ID where resources will be created. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | GCP Region. | `string` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | network for gke | `string` | n/a | yes |
| <a name="input_vpc_network"></a> [vpc\_network](#input\_vpc\_network) | network for gke | `string` | n/a | yes |
| <a name="input_worker_subnet_cidr"></a> [worker\_subnet\_cidr](#input\_worker\_subnet\_cidr) | bastion subnet | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
