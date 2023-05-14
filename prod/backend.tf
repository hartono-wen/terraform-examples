terraform {
  required_version = ">= 0.14.9"

  backend "s3" {
    bucket = "hartonowen-terraform-backend"
    key    = "aws-infra-prod"
    region = "ap-southeast-3"
  }
}
