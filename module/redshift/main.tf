resource "aws_redshift_cluster" "redshift_cluster" {
  allow_version_upgrade                = true
  apply_immediately                    = null
  automated_snapshot_retention_period  = 1
  availability_zone                    = "eu-west-1a"
  availability_zone_relocation_enabled = true
  cluster_identifier                   = "redshift-cluster-1"
  cluster_parameter_group_name         = "default.redshift-2.0"
  cluster_subnet_group_name            = "capstonesubnetgroup"
  cluster_type                         = "single-node"
  cluster_version                      = "1.0"
  database_name                        = "dev"
  default_iam_role_arn                 = "arn:aws:iam::${var.account_id}:role/service-role/AmazonRedshift-CommandsAccessRole-20250711T180655"
  elastic_ip                           = null
  encrypted                            = "true"
  enhanced_vpc_routing                 = false
  final_snapshot_identifier            = null
  iam_roles                            = ["arn:aws:iam::${var.account_id}:role/service-role/AmazonRedshift-CommandsAccessRole-20250711T180655"]
  maintenance_track_name               = "current"
  manage_master_password               = null
  manual_snapshot_retention_period     = -1
  master_password                      = null # sensitive
  master_password_secret_kms_key_id    = null
  master_password_wo                   = null # sensitive
  master_password_wo_version           = null
  master_username                      = "awsuser"
  multi_az                             = false
  node_type                            = "ra3.large"
  number_of_nodes                      = 1
  owner_account                        = null
  port                                 = 5439
  preferred_maintenance_window         = "sat:22:00-sat:22:30"
  publicly_accessible                  = true
  region                               = "eu-west-1"
  skip_final_snapshot                  = true
  snapshot_arn                         = null
  snapshot_cluster_identifier          = null
  snapshot_identifier                  = null
  tags                                 = {}
  tags_all                             = {}
  vpc_security_group_ids               = ["sg-001439246f1548c38"]
}

variable "account_id" {
  description = "The AWS account ID"
  type        = string

}
