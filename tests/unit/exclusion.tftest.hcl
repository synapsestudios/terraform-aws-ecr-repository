mock_provider "aws" {
  mock_data "aws_iam_policy_document" {
    defaults = {
      json = "{\"Version\":\"2012-10-17\",\"Statement\":[]}"
    }
  }
}

run "exclusion_mode_renders_latest_filter" {
  command = plan

  variables {
    name                 = "backend"
    allowed_arns         = ["arn:aws:iam::123456789012:root"]
    image_tag_mutability = "IMMUTABLE_WITH_EXCLUSION"
    image_tag_mutability_exclusion_filter = [
      { filter = "latest" }
    ]
  }

  assert {
    condition     = aws_ecr_repository.this.image_tag_mutability == "IMMUTABLE_WITH_EXCLUSION"
    error_message = "expected exclusion mutability mode"
  }

  assert {
    condition     = one(aws_ecr_repository.this.image_tag_mutability_exclusion_filter).filter == "latest"
    error_message = "expected exactly the latest tag excluded from immutability"
  }

  assert {
    condition     = one(aws_ecr_repository.this.image_tag_mutability_exclusion_filter).filter_type == "WILDCARD"
    error_message = "filter_type must default to WILDCARD"
  }
}
