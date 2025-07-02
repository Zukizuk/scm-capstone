provider "aws" {
  region = var.region
  default_tags {
    tags = {
      project = "capstone"
      name    = "Supply Chain Management"
    }
  }
}
