resource "aws_db_instance" "default" {
  allocated_storage   = 10
  db_name             = "mydb"
  engine              = "postgres"
  instance_class      = "db.t3.micro"
  username            = "postgres"
  password            = var.rds_password
  skip_final_snapshot = true
  publicly_accessible = true
}

variable "rds_password" {
  type        = string
  description = "The password for the RDS database."
}
