# providers.tf
provider "aws" {
  region = "us-east-1"
  # assume_role {
  #   role_arn = "arn:aws:sts::200901485389:assumed-role/RCSL2Role/likith.t@rapyder.com"
  # }
}