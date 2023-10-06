####################routetable############
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.rt_cidr
    gateway_id = aws_internet_gateway.IGW.id
  }
  tags = {
    Name = "Public-rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.rt_cidr
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "Private-rt"
  }
}