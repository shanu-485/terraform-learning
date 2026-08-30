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


data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = ["day22-public-subnet-2"]
  }
}

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name    = "day23-nat-eip"
    Project = "Terraform Learning"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = data.aws_subnet.public.id

  tags = {
    Name    = "day23-nat-gateway"
    Project = "Terraform Learning"
  }

  depends_on = [aws_eip.nat]
}

data "aws_route_table" "private" {
  filter {
    name   = "tag:Name"
    values = ["day22-private-route-table"]
  }
}

resource "aws_route" "private_nat" {
  route_table_id         = data.aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main.id
}

