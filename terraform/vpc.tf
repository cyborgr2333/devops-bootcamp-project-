# Create the VPC 
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"
  tags = { Name = "devops-vpc" }
}

# Public Subnet for Web Server 
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/25"
  map_public_ip_on_launch = true
  tags = { Name = "devops-public-subnet" }
}

# Private Subnet for Ansible & Monitoring 
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.128/25"
  tags = { Name = "devops-private-subnet" }
}

# Internet Gateway for Public access 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "devops-igw" }
}

# NAT Gateway for Private Subnet internet access 
resource "aws_eip" "nat" { domain = "vpc" }

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id # NAT sits in public subnet
  tags          = { Name = "devops-ngw" }
}
