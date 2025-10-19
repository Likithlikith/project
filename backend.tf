terraform {
  backend "s3" {
    bucket = "likith-terraform-bucket-12"
    key    = "mayotiqa/terraform.tfstate"
    region = "us-east-1"
  }
}