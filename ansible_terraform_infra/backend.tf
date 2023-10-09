terraform {
  backend "s3" {
    bucket = "devopsremotestate1"
    key    = "dev/ansible.tfstate"
    region = "us-east-1"
  }
}
