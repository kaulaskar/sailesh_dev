######################vpc#############
data "aws_vpc" "my-vpc" {
  id = "vpc-00799757fc6f63de0"
}

################subnet###################
resource "aws_subnet" "subnet-public" {
  vpc_id            = data.aws_vpc.my-vpc.id
  cidr_block        = "10.1.2.0/25"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "subnet" 
  }
}


################IGW###############
data "aws_internet_gateway" "my-ig" {
     internet_gateway_id = "igw-0cb036c218f49bf57"
    
  
}

################routtable###################
resource "aws_route_table" "public_rt1" {
  vpc_id = data.aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.my-ig.id
  }
  tags = {
    Name = "Public-rt"
  }
}

################subnetassocation###################
resource "aws_route_table_association" "Public_rt1" {
  subnet_id      = aws_subnet.subnet-public.id
  route_table_id = aws_route_table.public_rt1.id
}


################securitygroup###################
resource "aws_security_group" "allow_all" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.my-vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  
  }

  tags = {
    Name = "allow_tls"
  }
}

################instance###################
resource "aws_instance" "server" {
  count = 3
  ami = "ami-0f5ee92e2d63afc18"
  instance_type               = "t2.micro"
  key_name                    = "desktop-key"
  subnet_id                   = aws_subnet.subnet-public.id
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  associate_public_ip_address = true
  tags = {
    Name       = "server-${count.index+1}"
    
  }
  user_data = <<-EOT
    #!/bin/bash
    "sleep 15",
    "sudo useradd -m ansibleadminadmin --shell /bin/bash,
    "sudo mkdir -p /home/ansibleadmin/.ssh,
    "sudo chown -R ansibleadmin /home/ansibleadmin/",
    "sudo touch /home/ansibleadmin/.ssh/authorized_keys",
    "sudo usermod -aG sudo ansibleadmin",
    "echo 'ansibleadmin ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers",
    "echo 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCGWDbZCKxFEmhkhabxjehKqVHTbyOmHpX7BasjtUxRaBGMt7meXM7VgDpHyAll2AUI+AZdbA214GUXaI+trJVsFXQwy1zecwC1dJMdlrK8Ich9EuZQVUYN2RlghmpVymND64xFGcI/KZpjbZzpQPAKqWURYgk9B7MAlWcN2PNTuBcmsdW1kGo+FeYJD1nJZVrmI/AjNLA4gtMt4GztOtBgJ8aaZgF94+PiptF5/N/nvsypk4bFw5/Mx5INrsUYGAjS2ZEJ/e+5HB/QCcuOSrjyAOoIVOZC1qVecCctfOyYVi9BShvW0FNA2NX9xdXVi6XipYnSTDPBoMwn0FjHavsN' | sudo tee /home/ansibleadmin/.ssh/authorized_keys"
  EOT
}