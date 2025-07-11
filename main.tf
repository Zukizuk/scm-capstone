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

module "redshift" {
  source = "./module/redshift"

  kms_key_id = var.kms_key_id

}

import {
  to = aws_redshift_cluster.myprodcluster
  id = "redshift-cluster"
}

import {
  to = aws_glue_job.LoadToGold
  id = "LoadToGold"
}

import {
  to = aws_glue_job.Transform_Load_to_Silver
  id = "TransformAndLoadToSilver"
}
