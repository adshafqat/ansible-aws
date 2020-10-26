Ansible MiniKube Installer
==========================

AWS Based Installation
----------------------
1. This respository contain playbooks to create AWS Servers using Terraform.
2. Playbooks to install Kubernetes on newly created AWS Servers

Local Virtual Box based Installation
----------------------
1. Vagrant scripts to create local Centos 8 virtual machines
2. Playbooks to install Kubernetes on newly created vms


Prerequisites for AWS Based Installation
------------
1. Terraform
2. Ansible 
3. AWS Collection on Ansible controller: ansible-galaxy collection install amazon.aws
4. Install boto on Ansible controller: pip3 install boto
5. The user home directory should have a folder named .aws with credentials file

Prerequisites for Local Installation
------------
1. Oracle Virtual Box
2. Ansible 
3. Vagrant


Steps for AWS Based Installation
----------------------------
1. Generate a SSH key-pair. The SSH key-pair will be used in the Terraform to connect to the EC2 instances.

```
ssh-keygen -t rsa -b 2048 -f ~/.ssh/aws-servers-key-pair.pem -q -P ''
chmod 400 ~/.ssh/aws-servers-key-pair.pem
ssh-keygen -y -f ~/.ssh/aws-servers-key-pair.pem > ~/.ssh/aws-servers-key-pair.pub
```

2. A blank inventory file with only one line [all]. This playbook dynamically update inventory file with newly created server IPs.
3. For Terraform initlization: ansible-playbook -i inventory.ini terraform_init.yml
4. VM Creation in Terraform:  ansible-playbook -i inventory.ini create_cluster.yml 
5. For Setting up a Kubernetes Cluster in AWS: ansible-playbook -i inventory.ini setupkubernetes.yml
6. For Destroying EC2 instances: ansible-playbook -i inventory.ini destroy_servers.yml

Steps for Local Installation
----------------------------
1. Run vagrant up to create new Centos 8 virtual machines
2. Update local.ini with newly created VM IP addresses
2. Setup a Local three nodes cluster: ansible-playbook -i local.ini setuplocalkubernetes.yml 


Reference
------------
https://docs.ansible.com/ansible/2.5/modules/terraform_module.html  <br />
https://galaxy.ansible.com/amazon/aws?extIdCarryOver=true&sc_cid=701f2000001OH7YAAW

Author
------------
Adeel Shafqat
http://www.zaynsolutions.com
