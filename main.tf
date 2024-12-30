# Define AWS provider
provider "aws" {
  region  = "ap-south-1"
  profile = "default"  # Use credentials from AWS CLI
}

# Create a key pair for SSH access
resource "aws_key_pair" "my_key" {
  key_name   = "my-key-pair"
  public_key = file("~/.ssh/id_rsa.pub")
}

# EC2 Instance 1
resource "aws_instance" "server1" {
  ami           = "ami-03c68e52484d7488f"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name
  tags = {
    Name = "Server1"
  }
}

# EC2 Instance 2
resource "aws_instance" "server2" {
  ami           = "ami-03c68e52484d7488f"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name
  tags = {
    Name = "Server2"
  }
}

# Output Public IPs
output "instance_ips" {
  value = [
    aws_instance.server1.public_ip,
    aws_instance.server2.public_ip
  ]
}
