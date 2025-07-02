resource "aws_redshift_cluster" "mycluster" {
  cluster_identifier  = "redshift-cluster-1"
  database_name       = "dev"
  master_username     = "exampleuser"
  master_password     = "examplepassword"
  node_type           = "dc1.large"
  cluster_type        = "single-node"
  publicly_accessible = true
}
