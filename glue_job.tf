# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_glue_job" "LoadToGold" {
  connections = []
  default_arguments = {
    "--TempDir"                      = "s3://aws-glue-assets-448049788660-eu-west-1/temporary/"
    "--enable-glue-datacatalog"      = "true"
    "--enable-job-insights"          = "true"
    "--enable-metrics"               = "true"
    "--enable-observability-metrics" = "true"
    "--enable-spark-ui"              = "true"
    "--job-bookmark-option"          = "job-bookmark-disable"
    "--job-language"                 = "python"
    "--spark-event-logs-path"        = "s3://aws-glue-assets-448049788660-eu-west-1/sparkHistoryLogs/"
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
  role_arn                  = "arn:aws:iam::448049788660:role/GlueRole"
  security_configuration    = null
  tags                      = {}
  tags_all                  = {}
  timeout                   = 480
  command {
    name            = "glueetl"
    python_version  = "3"
    runtime         = null
    script_location = "s3://aws-glue-assets-448049788660-eu-west-1/scripts/LoadToGold.py"
  }
  execution_property {
    max_concurrent_runs = 1
  }
}

resource "aws_glue_job" "Transform_Load_to_Silver" {
  connections = []
  default_arguments = {
    "--TempDir"                      = "s3://aws-glue-assets-448049788660-eu-west-1/temporary/"
    "--enable-glue-datacatalog"      = "true"
    "--enable-job-insights"          = "true"
    "--enable-metrics"               = "true"
    "--enable-observability-metrics" = "true"
    "--enable-spark-ui"              = "true"
    "--job-bookmark-option"          = "job-bookmark-disable"
    "--job-language"                 = "python"
    "--spark-event-logs-path"        = "s3://aws-glue-assets-448049788660-eu-west-1/sparkHistoryLogs/"
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
  role_arn                  = "arn:aws:iam::448049788660:role/GlueRole"
  security_configuration    = null
  tags                      = {}
  tags_all                  = {}
  timeout                   = 480
  command {
    name            = "glueetl"
    python_version  = "3"
    runtime         = null
    script_location = "s3://aws-glue-assets-448049788660-eu-west-1/scripts/TransformAndLoadToSilver.py"
  }
  execution_property {
    max_concurrent_runs = 1
  }
}
