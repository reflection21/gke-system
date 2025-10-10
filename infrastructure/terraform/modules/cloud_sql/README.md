# cloud_sql

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_sql_database.database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.db](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_user.reflection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_subnet"></a> [bastion\_subnet](#input\_bastion\_subnet) | bastion subnet | `string` | n/a | yes |
| <a name="input_db_instance_name"></a> [db\_instance\_name](#input\_db\_instance\_name) | db instance name | `string` | `"db"` | no |
| <a name="input_db_subnet"></a> [db\_subnet](#input\_db\_subnet) | subnet for db | `string` | n/a | yes |
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | gcp project | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | gcp region | `string` | n/a | yes |
| <a name="input_root_password"></a> [root\_password](#input\_root\_password) | passwd for reflection | `string` | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | vpc | `string` | n/a | yes |
| <a name="input_worker_subnet"></a> [worker\_subnet](#input\_worker\_subnet) | node pool subnet | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
