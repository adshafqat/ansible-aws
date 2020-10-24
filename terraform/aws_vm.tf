terraform {
  required_version = ">= 0.12"
}


resource "aws_key_pair" "aws_key" {
  key_name   = var.key_name
  public_key = file(var.public_key)
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

resource "aws_instance" "master" {
  ami           = var.ami
  instance_type = var.aws_instance
  key_name      = aws_key_pair.aws_key.key_name

  vpc_security_group_ids = [
      var.vpc_security_group_ids
   ]
  root_block_device {
    volume_size="30"
    volume_type = "standard"	
	}

  tags = {
    Name = "kube-master"
  }
  /*
  provisioner "local-exec" {
    command = "echo Need to find how to Start a server if it is stoped ${aws_instance.web.private_ip} >> private_ips.txt"
  }
*/
}
resource "aws_instance" "infra" {
  ami           = var.ami
  instance_type = var.aws_instance
  key_name      = aws_key_pair.aws_key.key_name
  vpc_security_group_ids = [
      var.vpc_security_group_ids
   ]
  root_block_device {
    volume_size="30"
    volume_type = "standard"	
	}

  tags = {
    Name = "kube-infra"
  }

}  
resource "aws_instance" "worker" {
  ami           = var.ami
  instance_type = var.aws_instance
  key_name      = aws_key_pair.aws_key.key_name
  vpc_security_group_ids = [
      var.vpc_security_group_ids
   ]
  
  tags = {
    Name = "kube-worker"
  }


  root_block_device {
    volume_size="30"
    volume_type = "standard"	
	}

}
#Need to enhance this script to support multiple master, worker and infra nodes
output "masterip" {
  value = aws_instance.master.public_ip
}
output "infraip" {
  value = aws_instance.infra.public_ip
}
output "workerip" {
  value = aws_instance.worker.public_ip
}

output "masterinstanceid" {
  value = aws_instance.master.id
}
output "infrainstanceid" {
  value = aws_instance.infra.id
}
output "workerinstanceid" {
  value = aws_instance.worker.id
}

