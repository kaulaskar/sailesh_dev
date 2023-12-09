terraform {
  backend "s3" {
    bucket = "terraform-state-files01"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}