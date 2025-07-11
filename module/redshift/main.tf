# resource "aws_redshift_cluster" "myprodcluster" {
#   allow_version_upgrade                = true
#   apply_immediately                    = null
#   automated_snapshot_retention_period  = 1
#   availability_zone                    = "eu-west-1c"
#   availability_zone_relocation_enabled = true
#   cluster_identifier                   = "redshift-cluster"
#   cluster_parameter_group_name         = "default.redshift-2.0"
#   cluster_subnet_group_name            = "default"
#   cluster_type                         = "single-node"
#   cluster_version                      = "1.0"
#   database_name                        = "dev"
#   default_iam_role_arn                 = null
#   elastic_ip                           = null
#   encrypted                            = "true"
#   enhanced_vpc_routing                 = false
#   final_snapshot_identifier            = null
#   iam_roles                            = []
#   kms_key_id                           = var.kms_key_id
#   maintenance_track_name               = "current"
#   manage_master_password               = null
#   manual_snapshot_retention_period     = -1
#   master_password                      = null # sensitive
#   master_password_secret_kms_key_id    = null
#   master_password_wo                   = null # sensitive
#   master_password_wo_version           = null
#   master_username                      = "awsuser"
#   multi_az                             = false
#   node_type                            = "ra3.large"
#   number_of_nodes                      = 1
#   owner_account                        = null
#   port                                 = 5439
#   preferred_maintenance_window         = "thu:05:30-thu:06:00"
#   publicly_accessible                  = false
#   region                               = "eu-west-1"
#   skip_final_snapshot                  = true
#   snapshot_arn                         = null
#   snapshot_cluster_identifier          = null
#   snapshot_identifier                  = null
#   tags                                 = {}
#   tags_all                             = {}
#   vpc_security_group_ids               = ["sg-047ccd8405b5e2aef"]
# }


variable "kms_key_id" {
  type        = string
  description = "The KMS key ID for the Redshift cluster."
}
