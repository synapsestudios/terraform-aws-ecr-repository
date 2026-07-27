mock_provider "aws" {
  # aws_ecr_repository_policy validates that policy is valid JSON at plan time;
  # the mock provider otherwise returns a random string for the computed .json.
  mock_data "aws_iam_policy_document" {
    defaults = {
      json = "{\"Version\":\"2012-10-17\",\"Statement\":[]}"
    }
  }
}

run "immutable_mode_sets_value" {
  command = plan

  variables {
    name                 = "backend"
    allowed_arns         = ["arn:aws:iam::123456789012:root"]
    image_tag_mutability = "IMMUTABLE"
  }

  assert {
    condition     = aws_ecr_repository.this.image_tag_mutability == "IMMUTABLE"
    error_message = "image_tag_mutability variable must drive the resource argument"
  }
}

run "defaults_preserve_mutable" {
  command = plan

  variables {
    name         = "backend"
    allowed_arns = ["arn:aws:iam::123456789012:root"]
  }

  assert {
    condition     = aws_ecr_repository.this.image_tag_mutability == "MUTABLE"
    error_message = "default must stay MUTABLE so existing consumers see no behavior change"
  }

  assert {
    condition     = length(aws_ecr_repository.this.image_tag_mutability_exclusion_filter) == 0
    error_message = "no exclusion filters should render by default"
  }
}
