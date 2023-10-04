###################subnet##################
resource "aws_subnet" "subnet1-public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.az

  tags = {
    Name = "Public-Subnet"
  }
}