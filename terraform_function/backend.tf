terraform {
  backend "s3" {
    bucket = "devopsremotestate1"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}
