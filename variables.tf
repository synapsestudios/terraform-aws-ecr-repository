variable "name" {
  type        = string
  description = "The name of the image repository that we are going to create"
}

variable "allowed_arns" {
  type        = list(string)
  description = "The list of IAM user arns that are allowed to push and pull to and from the repository"
}

