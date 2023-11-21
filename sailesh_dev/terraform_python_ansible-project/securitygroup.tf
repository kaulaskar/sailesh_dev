#############securityGroup##############

# locals {
#   ingress = var.ingress
#   egress = var.egress
# }

# resource "aws_security_group" "allow_all" {
#   name        = "allow_all"
#   description = "Allow all traffic"
#   vpc_id      = aws_vpc.main.id

#   dynamic "ingress" {
#     for_each = local.ingress
#     content {
#       from_port   = ingress.value
#       to_port     = ingress.value
#       protocol    = "tcp"
#       cidr_blocks = [var.allow_all]
#     }
#   }

#   dynamic "egress" {
#     for_each = local.egress
#     content {
#       from_port   = egress.value
#       to_port     = egress.value
#       protocol    = "tcp"
#       cidr_blocks = [var.allow_all]
#     }
#   }
# }

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all traffic"
  vpc_id      = aws_vpc.main.id

  ingress {

    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks = [var.allow_all]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks = [var.allow_all]
  
  }

  tags = {
    Name = "allow_all"
  }
}