terraform {
  backend "s3" {
    bucket  = "chatty-app-teraform-state-gnis" # Your unique AWS S3 bucket
    key     = "develop/chatapp.tfstate"
    region  = "us-east-1" # Your AWS region
    encrypt = true
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"

  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    ManagedBy   = "Terraform"
    Owner       = "Kyo Ueda" # Your fullname
  }
}
