##########ec2-instance#################
resource "aws_instance" "server-1" {
  ami = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  associate_public_ip_address = true
  tags = {
    Name       = var.server_name
  }
  # user_data = <<-EOF
	# 	#!/bin/bash
  #   sudo apt-get update
  #   sudo apt-get install python3-pip -y
  #   sudo pip3 install ansible
	# EOF
  # # Copies the file as the ubuntu user using SSH
  # # Copies the file as the Administrator user using WinRM
  # provisioner "file" {  
  #   source      = "script.py"
  #   destination = "/tmp/script.py"
  #   connection {
  #     type        = "ssh"
  #     user        = "ubuntu"
  #     private_key = file("private-key.pem")
  #     host        = aws_instance.server-1.public_ip
  #   }
  # }
}

resource "null_resource" "install_and_copy" {

  # User data to install Python and Ansible
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y python3",
      "sudo apt-get install -y python3-pip",
      "sudo pip3 install ansible"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("private-key.pem")
      host        = aws_instance.server-1.public_ip
    }
  }
# File provisioner to copy a local file to the remote machine
  provisioner "file" {  
    source      = "script.py"
    destination = "/tmp/script.py"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("private-key.pem")
      host        = aws_instance.server-1.public_ip
    }
  }
   provisioner "remote-exec" {
    inline = [
      " sudo chmod 777 /tmp/script.py ",
      " sudo python3 /tmp/script.py ",
      
    ]
  # provisioner "remote-exec" {
  #   inline = [
  #     "cd /tmp",
  #     "python3 /tmp/script.py",
  #   ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("private-key.pem")
      host        = aws_instance.server-1.public_ip
    }
  }

}



