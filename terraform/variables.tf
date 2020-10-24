variable "aws_profile" {
  default = "default"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "aws_instance" {
  default = "t2.micro"
}

variable "key_name" {
  default = "aws-servers-key-pair"
}


variable "private_key" {
  default = "~/.ssh/aws-servers-key-pair.pem"
}


variable "public_key" {
  default = "~/.ssh/aws-servers-key-pair.pub"
}

variable "ansible_user" {
  default = "ec2-user"
}


variable "ami" {
  default = "ami-098f16afa9edf40be"
}

variable "vpc_security_group_ids" {
  default = "sg-0bae1945130ea72fa"
}