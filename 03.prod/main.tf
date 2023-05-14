terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.66.1"
    }
  }

  required_version = ">= 0.14.9"

}

provider "aws" {
  region  = "ap-southeast-3"
}