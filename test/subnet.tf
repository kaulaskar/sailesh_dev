###################subnet##################

resource "aws_subnet" "subnet-public" {
  # count = 3
  count = length(var.subnet_cidr_public)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.subnet_cidr_public, count.index)
  availability_zone = element(var.az, count.index)

  tags = {
    Name = "Public-Subnet-${count.index+1}"
  }
}


resource "aws_subnet" "subnet-private" {
  # count = 3
  count = length(var.subnet_cidr_private)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.subnet_cidr_private, count.index)
  availability_zone = element(var.az, count.index)

  tags = {
    Name = "Private-Subnet-${count.index+1}"
  }
}