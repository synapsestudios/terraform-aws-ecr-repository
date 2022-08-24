variable "name" {
  type        = string
  description = "The name of the image repository that we are going to create"
}

variable "allowed_arns" {
  type        = list(string)
  description = "The list of IAM user arns that are allowed to push and pull to and from the repository"
}

variable "region" {
  type        = string
  default     = "us-west-2"
  description = "Define the region you'd wish the cloudtrail resources to be created in, example: us-west-2"
}

