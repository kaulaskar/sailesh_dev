import os
import socket

# Define the playbook content
playbook_content = """
---
- name: Install Nginx
  hosts: local
  become: true

  tasks:
    - name: Update apt cache (for Ubuntu/Debian systems)
      apt:
        update_cache: yes
      when: ansible_os_family == 'ubuntu'

    - name: Install Nginx
      package:
        name: nginx
        state: present

    - name: Start Nginx service
      service:
        name: nginx
        state: started

    - name: Enable Nginx service at boot
      service:
        name: nginx
        enabled: yes
"""

# Write playbook to a file
playbook_path = "install_nginx.yml"
with open(playbook_path, "w") as playbook_file:
    playbook_file.write(playbook_content)



# Get local host IP address
local_ip = socket.gethostbyname(socket.gethostname())

# Create inventory file
inventory_content = f"""
[local]
localhost ansible_host={local_ip} ansible_connection=local ansible_user=ubuntu
"""

with open("inventory_file", "w") as inventory_file:
    inventory_file.write(inventory_content)

print(f"Inventory file created: inventory_file")

# Run Ansible playbook
ansible_command = f"ansible-playbook -i inventory_file {playbook_path}"
os.system(ansible_command)

# Cleanup: Remove the playbook file
#os.remove(playbook_path)
