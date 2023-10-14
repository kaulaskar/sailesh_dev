######################vpc#############
data "aws_vpc" "my-vpc" {
  id = "vpc-00799757fc6f63de0"


}

################subnet###################
resource "aws_subnet" "subnet-public" {
  vpc_id            = data.aws_vpc.my-vpc.id
  cidr_block        = "10.1.2.0/25"
  availability_zone = "ap-south-1a"

  #   tags = {
  #     Name = "subnet" 
  #   }
  # }


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

  # ################subnetassocation###################
  # resource "aws_route_table_association" "Public_rt1" {
  #   subnet_id      = aws_subnet.subnet-public.id
  #   route_table_id = aws_route_table.public_rt1.id
  # }


  ################securitygroup###################
  resource "aws_security_group" "allow_all" {
    name        = "allow_tls"
    description = "Allow TLS inbound traffic"
    vpc_id      = data.aws_vpc.my-vpc.id

    #   ingress {
    #     description      = "TLS from VPC"
    #     from_port        = 0
    #     to_port          = 0
    #     protocol         = "-1"
    #     cidr_blocks      = ["0.0.0.0/0"]

    #   }

    #   egress {
    #     from_port        = 0
    #     to_port          = 0
    #     protocol         = "-1"
    #     cidr_blocks      = ["0.0.0.0/0"]

    #   }

    tags = {
      Name = "allow_tls"
    }
  }

  ################instance###################
  resource "aws_instance" "server" {
    # count = 1
    ami                         = "ami-0f5ee92e2d63afc18"
    instance_type               = "t2.micro"
    key_name                    = "desktop-key"
    subnet_id                   = aws_subnet.subnet-public.id
    vpc_security_group_ids      = [aws_security_group.allow_all.id]
    associate_public_ip_address = true
    tags = {
      Name = "server"
    }
    user_data = <<EOF
  #!/bin/bash

  echo "Copying the SSH Key"
  sudo echo "key" > /opt/keys
  sleep 10
  cat /opt/keys >> /root/.ssh/authorized_keys
  
  EOF
  }
}




# # # Create a local provisioner to run a script on your local machine
# provisioner "local-exec" {
#   command = <<-EOT
#     #!/bin/bash
#     mkdir -p ansible_inventory
#     for ip in ${aws_instance.server[*].public_ip}; do
#       echo "$ip" >> ansible_inventory/hosts.txt
#     done
#   EOT
# }

# # # # Create a local provisioner to run a script on your local machine
# # provisioner "local-exec" {
# #   command = <<-EOT
# #     #!/bin/bash
# #     mkdir -p ansible_inventory
# #     for ip in ${aws_instance.server[*].public_ip}; do
# #       echo "$ip" >> ansible_inventory/hosts.txt
# #     done
# #   EOT
# # }

# # Output the IP addresses of the instances (optional)

# data "data.my-vpc" "my-vpc" {
#   id = "vpc-00799757fc6f63de0"
# }

# data "aws_route_table" "public_rt" {
#   route_table_id = "rtb-06a308a5a90b63396"
# }

# resource "data.my-vpc_peering_connection" "my-vpc" {
#   peer_vpc_id = data.data.aws_vpc.my-vpc.id
#   vpc_id      = data.aws_vpc.my-vpc.id
#   auto_accept = true
#   accepter {
#     allow_remote_vpc_dns_resolution = true
#   }

#   requester {
#     allow_remote_vpc_dns_resolution = true
#   }
# }

# resource "aws_route" "to-my-vpc" {
#   route_table_id            = aws_route_table.public_rt1.id
#   destination_cidr_block    = "10.1.0.0/16"
#   vpc_peering_connection_id = data.my-vpc_peering_connection.my-vpc.id
# }

# resource "aws_route" "from-my-vpc" {
#   route_table_id            = data.aws_route_table.public_rt.id
#   destination_cidr_block    = "10.0.0.0/16"
#   vpc_peering_connection_id = data.my-vpc_peering_connection.my-vpc.id
# }



# output "instance_public_ips" {
#   value = aws_instance.server.*.public_ip
# }

# output "instance_privat_ips" {
#   value = aws_instance.server.*.private_ip
# }
