# registry

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
| [google_artifact_registry_repository.docker_repo](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/artifact_registry_repository) | resource |
| [google_kms_crypto_key_iam_member.registry_kms](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/kms_crypto_key_iam_member) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deployment_prefix"></a> [deployment\_prefix](#input\_deployment\_prefix) | Prefix of the deployment | `string` | n/a | yes |
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP Project ID where resources will be created. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | GCP Region. | `string` | n/a | yes |
| <a name="input_registry_key"></a> [registry\_key](#input\_registry\_key) | key for encrypt repo | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
