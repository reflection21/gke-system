# firewall

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
| [google_compute_firewall.allow_iap_gke](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.ingress_bastion](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/compute_firewall) | resource |
| [google_project_iam_member.iap_tunnel](https://registry.terraform.io/providers/hashicorp/google/7.4.0/docs/resources/project_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_subnet"></a> [bastion\_subnet](#input\_bastion\_subnet) | bastion subnet | `string` | n/a | yes |
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP Project ID where resources will be created. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | GCP Region. | `string` | n/a | yes |
| <a name="input_vpc_network"></a> [vpc\_network](#input\_vpc\_network) | my vpc | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ingress_firewall_bastion"></a> [ingress\_firewall\_bastion](#output\_ingress\_firewall\_bastion) | ingress ssh traffic |
<!-- END_TF_DOCS -->
