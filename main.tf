module "s3" {
  source = "./module/s3"

  lake_bucket_name = var.lake_bucket_name
}

module "rds" {
  source       = "./module/rds"
  rds_password = var.rds_password
}


module "glue" {
  source       = "./module/glue"
  account_id   = var.account_id
  rds_endpoint = var.rds_endpoint
  rds_password = var.rds_password
}
