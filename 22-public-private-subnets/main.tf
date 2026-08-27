terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
data "aws_vpc" "day19" {
  filter {
    name   = "tag:Name"
    values = ["day19-vpc"]
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = data.aws_vpc.day19.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false

  tags = {
    Name    = "day22-private-subnet"
    Project = "Terraform Learning"
  }
}

resource "aws_route_table" "private" {
  vpc_id = data.aws_vpc.day19.id

  tags = {
    Name    = "day22-private-route-table"
    Project = "Terraform Learning"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_subnet" "public2" {
  vpc_id                  = data.aws_vpc.day19.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "day22-public-subnet-2"
    Project = "Terraform Learning"
  }
}

resource "aws_route_table" "public" {
  vpc_id = data.aws_vpc.day19.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.day19.id
  }

  tags = {
    Name    = "day22-public-route-table"
    Project = "Terraform Learning"
  }
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

data "aws_internet_gateway" "day19" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.day19.id]
  }
}

