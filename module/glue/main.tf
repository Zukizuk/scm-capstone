resource "aws_glue_catalog_database" "glue_database" {
  name = "capstone_glue_database"
}

resource "aws_glue_job" "LoadToGold" {
  connections = []
  default_arguments = {
    "--TempDir"                      = "s3://aws-glue-assets-${var.account_id}-eu-west-1/temporary/"
    "--enable-glue-datacatalog"      = "true"
    "--enable-job-insights"          = "true"
    "--enable-metrics"               = "true"
    "--enable-observability-metrics" = "true"
    "--enable-spark-ui"              = "true"
    "--job-bookmark-option"          = "job-bookmark-disable"
    "--job-language"                 = "python"
    "--spark-event-logs-path"        = "s3://aws-glue-assets-${var.account_id}-eu-west-1/sparkHistoryLogs/"
  }
  description               = null
  execution_class           = "STANDARD"
  glue_version              = "5.0"
  job_run_queuing_enabled   = false
  maintenance_window        = null
  max_capacity              = 2
  max_retries               = 0
  name                      = "LoadToGold"
  non_overridable_arguments = {}
  region                    = "eu-west-1"
  role_arn                  = "arn:aws:iam::${var.account_id}:role/GlueRole"
  security_configuration    = null
  tags                      = {}
  tags_all                  = {}
  timeout                   = 480
  command {
    name            = "glueetl"
    python_version  = "3"
    runtime         = null
    script_location = "s3://aws-glue-assets-${var.account_id}-eu-west-1/scripts/LoadToGold.py"
  }
  execution_property {
    max_concurrent_runs = 1
  }
}

resource "aws_glue_job" "Transform_Load_to_Silver" {
  connections = []
  default_arguments = {
    "--TempDir"                      = "s3://aws-glue-assets-${var.account_id}-eu-west-1/temporary/"
    "--enable-glue-datacatalog"      = "true"
    "--enable-job-insights"          = "true"
    "--enable-metrics"               = "true"
    "--enable-observability-metrics" = "true"
    "--enable-spark-ui"              = "true"
    "--job-bookmark-option"          = "job-bookmark-disable"
    "--job-language"                 = "python"
    "--spark-event-logs-path"        = "s3://aws-glue-assets-${var.account_id}-eu-west-1/sparkHistoryLogs/"
  }
  description               = null
  execution_class           = "STANDARD"
  glue_version              = "5.0"
  job_run_queuing_enabled   = false
  maintenance_window        = null
  max_capacity              = 2
  max_retries               = 0
  name                      = "TransformAndLoadToSilver"
  non_overridable_arguments = {}
  region                    = "eu-west-1"
  role_arn                  = "arn:aws:iam::${var.account_id}:role/GlueRole"
  security_configuration    = null
  tags                      = {}
  tags_all                  = {}
  timeout                   = 480
  command {
    name            = "glueetl"
    python_version  = "3"
    runtime         = null
    script_location = "s3://aws-glue-assets-${var.account_id}-eu-west-1/scripts/TransformAndLoadToSilver.py"
  }
  execution_property {
    max_concurrent_runs = 1
  }
}


resource "aws_glue_job" "ingest_job" {
  name                    = "IngestRDSDataToS3"
  role_arn                = "arn:aws:iam::${var.account_id}:role/GlueRole"
  glue_version            = "5.0"
  execution_class         = "STANDARD"
  job_run_queuing_enabled = false
  max_retries             = 0
  timeout                 = 480

  number_of_workers = 2
  worker_type       = "G.1X"

  connections = []

  default_arguments = {
    "--TempDir"                      = "s3://aws-glue-assets-${var.account_id}-eu-west-1/temporary/"
    "--enable-glue-datacatalog"      = "true"
    "--enable-job-insights"          = "true"
    "--enable-metrics"               = "true"
    "--enable-observability-metrics" = "true"
    "--enable-spark-ui"              = "true"
    "--job-bookmark-option"          = "job-bookmark-disable"
    "--job-language"                 = "python"
    "--spark-event-logs-path"        = "s3://aws-glue-assets-${var.account_id}-eu-west-1/sparkHistoryLogs/"
    "--TABLES_TO_EXTRACT"            = "products,locations,statuses,inventory,inventory_transactions,category_entity,supplier,supplier_key_metrics,damage_reports"
    "--RDS_ENDPOINT"                 = var.rds_endpoint
    "--RDS_PORT"                     = "5432"
    "--RDS_DB_NAME"                  = "mydb"
    "--RDS_USERNAME"                 = "postgres"
    "--RDS_PASSWORD"                 = var.rds_password
    "--S3_OUTPUT_BUCKET"             = "your-bucket"
  }

  non_overridable_arguments = {}

  command {
    name            = "glueetl"
    python_version  = "3"
    runtime         = null
    script_location = "s3://aws-glue-assets-${var.account_id}-eu-west-1/scripts/IngestRDSDataToS3.py"
  }

  execution_property {
    max_concurrent_runs = 1
  }

}

variable "account_id" {
  type = string
}

variable "rds_endpoint" {
  type        = string
  description = "The endpoint of the RDS instance to connect to."
}

variable "rds_password" {
  type        = string
  description = "The password for the RDS database."
}
