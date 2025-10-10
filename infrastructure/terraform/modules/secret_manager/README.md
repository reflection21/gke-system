# secret_manager

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 7.4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 7.4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_secret_manager_secret.my_passwords](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_version.root_password_version](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/secret_manager_secret_version) | resource |
| [random_password.root_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP Project ID where resources will be created. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | GCP Region. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_root_password"></a> [root\_password](#output\_root\_password) | passwd database |
<!-- END_TF_DOCS -->
