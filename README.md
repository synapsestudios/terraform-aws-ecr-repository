# ECR Repository

This module generates an ECR repository from a name to be used to store docker images and push to ECS.

https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-create.html

https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/US_SetupSNS.html

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.60.0 |

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
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | The tag mutability setting for the repository. One of MUTABLE, IMMUTABLE, IMMUTABLE\_WITH\_EXCLUSION, or MUTABLE\_WITH\_EXCLUSION. | `string` | `"MUTABLE"` | no |
| <a name="input_image_tag_mutability_exclusion_filter"></a> [image\_tag\_mutability\_exclusion\_filter](#input\_image\_tag\_mutability\_exclusion\_filter) | Tags excluded from the mutability setting. Only applies when image\_tag\_mutability is IMMUTABLE\_WITH\_EXCLUSION or MUTABLE\_WITH\_EXCLUSION. | <pre>list(object({<br/>    filter      = string<br/>    filter_type = optional(string, "WILDCARD")<br/>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the image repository that we are going to create | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
