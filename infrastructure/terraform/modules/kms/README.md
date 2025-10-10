# kms

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
| [google_kms_crypto_key.registry_key](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/kms_crypto_key) | resource |
| [google_kms_crypto_key_iam_member.gke_node_kms_access](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/kms_crypto_key_iam_member) | resource |
| [google_kms_key_ring.keys_repo](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/kms_key_ring) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP Project ID where resources will be created. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | GCP Region. | `string` | n/a | yes |
| <a name="input_registry_key"></a> [registry\_key](#input\_registry\_key) | key for encrypt repo | `string` | n/a | yes |
| <a name="input_sa_node_pool"></a> [sa\_node\_pool](#input\_sa\_node\_pool) | service acc node pool | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_registry_key"></a> [registry\_key](#output\_registry\_key) | encrypt repo key |
<!-- END_TF_DOCS -->
