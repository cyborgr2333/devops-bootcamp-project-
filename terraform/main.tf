# 1. Web Server (Public)
resource "aws_instance" "web_server" {
  ami                    = "ami-047126e50991d067b" # Ubuntu 24.04 in ap-southeast-1
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public.id
  private_ip             = "10.0.0.5"
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name
  tags                   = { Name = "Web-Server" }
}

# Mandatory Elastic IP for Web Server 
resource "aws_eip" "web_eip" {
  instance = aws_instance.web_server.id
  domain   = "vpc"
}

# 2. Ansible Controller (Private)
resource "aws_instance" "ansible_controller" {
  ami                    = "ami-047126e50991d067b"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private.id
  private_ip             = "10.0.0.135"
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name
  tags                   = { Name = "Ansible-Controller" }
}

# 3. Monitoring Server (Private)
resource "aws_instance" "monitoring_server" {
  ami                    = "ami-047126e50991d067b"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private.id
  private_ip             = "10.0.0.136"
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name
  tags                   = { Name = "Monitoring-Server" }
}

# ECR Repository 
resource "aws_ecr_repository" "project_repo" {
  name = "devops-bootcamp/final-project-sumantri" # Replace yourname
}


