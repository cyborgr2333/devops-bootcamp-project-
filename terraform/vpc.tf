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

# addition
# 1. Route Table for the Public Subnet (Uses IGW)
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = { Name = "devops-public-rt" }
}

# 2. Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# 3. Route Table for the Private Subnet (Uses NAT Gateway)
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = { Name = "devops-private-rt" }
}

# 4. Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
}
