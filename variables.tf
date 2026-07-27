variable "name" {
  type        = string
  description = "The name of the image repository that we are going to create"
}

variable "allowed_arns" {
  type        = list(string)
  description = "The list of IAM user arns that are allowed to push and pull to and from the repository"
}

variable "image_tag_mutability" {
  type        = string
  description = "The tag mutability setting for the repository. One of MUTABLE, IMMUTABLE, IMMUTABLE_WITH_EXCLUSION, or MUTABLE_WITH_EXCLUSION."
  default     = "MUTABLE"
}

variable "image_tag_mutability_exclusion_filter" {
  type = list(object({
    filter      = string
    filter_type = optional(string, "WILDCARD")
  }))
  description = "Tags excluded from the mutability setting. Only applies when image_tag_mutability is IMMUTABLE_WITH_EXCLUSION or MUTABLE_WITH_EXCLUSION."
  default     = []
}

