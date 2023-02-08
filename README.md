# ECR Repository

This module generates an ECR repository from a name to be used to store docker images and push to ECS.

https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-create.html

https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/US_SetupSNS.html

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.26.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_arns"></a> [allowed\_arns](#input\_allowed\_arns) | The list of IAM user arns that are allowed to push and pull to and from the repository | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the image repository that we are going to create | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
