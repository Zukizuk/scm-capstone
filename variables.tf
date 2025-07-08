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

variable "rds_password" {
  type        = string
  description = "The password for the RDS database."
}

variable "rds_endpoint" {
  type        = string
  description = "The endpoint of the RDS instance to connect to."

}
