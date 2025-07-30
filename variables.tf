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
  sensitive   = true
}

variable "rds_endpoint" {
  type        = string
  description = "The endpoint of the RDS instance to connect to."
}

variable "redshift_username" {
  type        = string
  description = "The username for the Redshift database."
}

variable "redshift_password" {
  type        = string
  description = "The password for the Redshift database."
  sensitive   = true
}

variable "kms_key_id" {
  type        = string
  description = "The KMS key ID for the Redshift cluster."
  sensitive   = true
}
