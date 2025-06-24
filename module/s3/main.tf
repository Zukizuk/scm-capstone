# Variables
variable "lake_bucket_name" {
  type = string
}


# Resources
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.lake_bucket_name
}

