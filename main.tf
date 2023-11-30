
terraform {
    cloud {
    organization = "kryptonian-engineer"

    workspaces {
      name = "terra-house-krypton"
    }
  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }

    aws = {
      source = "hashicorp/aws"
      version = "5.27.0"
    }
  }
}

provider "random" {
  # Configuration options
}
provider "aws" {
  
}
resource "random_string" "bucket_name" {
  length    = 32
  special   = false
  upper     = false
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}

output "random_bucket_name" {
    value = random_string.bucket_name.result
}