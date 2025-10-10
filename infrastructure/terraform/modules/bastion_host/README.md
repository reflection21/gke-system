# bastion_host

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
| [google_compute_instance.bastion_host](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/compute_instance) | resource |
| [google_compute_zones.available_zones](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/data-sources/compute_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_host_sa"></a> [bastion\_host\_sa](#input\_bastion\_host\_sa) | sa bastion host | `string` | n/a | yes |
| <a name="input_bastion_subnet"></a> [bastion\_subnet](#input\_bastion\_subnet) | bastion subnet | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP Project ID where resources will be created. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP Region. | `string` | n/a | yes |
| <a name="input_vpc_network"></a> [vpc\_network](#input\_vpc\_network) | vpc | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
