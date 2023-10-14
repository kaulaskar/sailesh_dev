


#  provisioner "remote-exec" {
#   command = <<-EOT
#     #!/bin/bash
#     "sleep 15",
#     "sudo useradd -m ansible --shell /bin/bash,
#     "sudo mkdir -p /home/ansible/.ssh,
#     "sudo chown -R ansible /home/ansible/",
#     "sudo touch /home/ansible/.ssh/authorized_keys",
#     "sudo usermod -aG sudo ansible",
#     "echo 'ansible ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers",
#     "echo 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCGWDbZCKxFEmhkhabxjehKqVHTbyOmHpX7BasjtUxRaBGMt7meXM7VgDpHyAll2AUI+AZdbA214GUXaI+trJVsFXQwy1zecwC1dJMdlrK8Ich9EuZQVUYN2RlghmpVymND64xFGcI/KZpjbZzpQPAKqWURYgk9B7MAlWcN2PNTuBcmsdW1kGo+FeYJD1nJZVrmI/AjNLA4gtMt4GztOtBgJ8aaZgF94+PiptF5/N/nvsypk4bFw5/Mx5INrsUYGAjS2ZEJ/e+5HB/QCcuOSrjyAOoIVOZC1qVecCctfOyYVi9BShvW0FNA2NX9xdXVi6XipYnSTDPBoMwn0FjHavsN' | sudo tee /home/ansible/.ssh/authorized_keys"
#   EOT
# }

#             "type": "shell",
#             "inline": [
#                 "sleep 15",
#                 "sudo useradd -m ansible --shell /bin/bash",
#                 "sudo mkdir -p /home/ansible/.ssh",
#                 "sudo chown -R ansible /home/ansible/",
#                 "sudo touch /home/ansible/.ssh/authorized_keys",
#                 "sudo usermod -aG sudo ansible",
#                 "echo 'ansible ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers",
#                 "echo 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCzsEivxCf8u9S9NbpZsCrRfshmy8BWUKuxNvmrDOObMALeNmF0T4Oqog2yXDMrOO6Iz9fTpNScPe9CzX5mtxMMK09hQbD1CZaQImYkq2U1UmO4pFgkRsszfvAAqbRPtaa2LTjE7fGOKd/B2S+ve4xD5/uWn3h8N2QODv2UKKwqChMXMthCL9rLuHmxxFrWNSkY2lq42kBN1o4shBbi18vH6liqbK6wkRQCYLtB1TJUDFoMTtydVZS+iXFuxPh6rHoEC+52TriVuHPhaHZYZFwO1GGsKWBsMCtZt83lN/tU/AO3i3VlL5n1JPSN/jqMpqR8pZnHFlTed4sMoMFgGcQx' | sudo tee /home/ansible/.ssh/authorized_keys"
#             ]