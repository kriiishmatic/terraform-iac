terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
    
  }
  backend "s3" {
    bucket = "terraform-state-kriiishmatic"
    key    = "local-practice"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}

provider "aws" {
  # Configuration options
}