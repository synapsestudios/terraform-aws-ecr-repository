mock_provider "aws" {
  mock_data "aws_iam_policy_document" {
    defaults = {
      json = "{\"Version\":\"2012-10-17\",\"Statement\":[]}"
    }
  }
}

run "retention_count_reaches_the_policy" {
  command = plan

  variables {
    name                  = "backend"
    allowed_arns          = ["arn:aws:iam::123456789012:root"]
    image_retention_count = 200
  }

  assert {
    condition     = one(jsondecode(aws_ecr_lifecycle_policy.this.policy).rules).selection.countNumber == 200
    error_message = "image_retention_count must drive countNumber"
  }

  assert {
    condition     = one(jsondecode(aws_ecr_lifecycle_policy.this.policy).rules).description == "only keep 200 builds"
    error_message = "the rule description must report the configured count"
  }
}

run "defaults_preserve_thirty" {
  command = plan

  variables {
    name         = "backend"
    allowed_arns = ["arn:aws:iam::123456789012:root"]
  }

  assert {
    condition     = one(jsondecode(aws_ecr_lifecycle_policy.this.policy).rules).selection.countNumber == 30
    error_message = "default must stay 30 so existing consumers see no behavior change"
  }
}

run "selection_criteria_are_unchanged" {
  command = plan

  variables {
    name                  = "backend"
    allowed_arns          = ["arn:aws:iam::123456789012:root"]
    image_retention_count = 200
  }

  assert {
    condition     = one(jsondecode(aws_ecr_lifecycle_policy.this.policy).rules).selection.tagStatus == "any"
    error_message = "the rule must select every image regardless of tag"
  }

  assert {
    condition     = one(jsondecode(aws_ecr_lifecycle_policy.this.policy).rules).selection.countType == "imageCountMoreThan"
    error_message = "count-based selection keeps the newest images and never empties the repository"
  }

  assert {
    condition     = one(jsondecode(aws_ecr_lifecycle_policy.this.policy).rules).action.type == "expire"
    error_message = "expire is the only action ECR supports"
  }
}
