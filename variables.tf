variable "region" {
  type        = string
  description = "The AWS region to deploy resources in."
}

variable "account_id" {
  type        = string
  description = "The AWS account ID."
}

variable "lake_bucket_name" {
  type = string
}
