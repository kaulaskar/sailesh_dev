terraform {
  backend "s3" {
    bucket = "devopsremotestate1"
    key    = "dev/module.tfstate"
    region = "us-east-1"
  }
}
