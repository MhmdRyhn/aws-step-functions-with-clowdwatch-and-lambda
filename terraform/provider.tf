//terraform {
//  required_version = ">=0.12.23"
//  required_providers {
//    archive = ">=1.3.0"
//    aws = ">=2.67.0"
//    template = ">=2.1.2"
//  }
//}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}
