# ECR Repository

This module generates an ECR repository from a name to be used to store docker images and push to ECS.

https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-create.html

https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/US_SetupSNS.html

## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider_aws) (4.26.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_ecr_lifecycle_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) (resource)
- [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) (resource)
- [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_allowed_arns"></a> [allowed_arns](#input_allowed_arns)

Description: The list of IAM user arns that are allowed to push and pull to and from the repository

Type: `list(string)`

### <a name="input_name"></a> [name](#input_name)

Description: The name of the image repository that we are going to create

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

No outputs.
