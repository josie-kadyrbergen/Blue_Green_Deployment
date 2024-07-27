provider "aws" {
  region = var.region
}

resource "aws_vpc" "group_4" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "group_4" {
  count = length(var.subnet_cidrs)
  vpc_id = aws_vpc.group_4.id
  cidr_block = var.subnet_cidrs[count.index]
  availability_zone = element(["${var.region}a", "${var.region}b", "${var.region}c"], count.index)
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "group_4" {
  vpc_id = aws_vpc.group_4.id
}

resource "aws_route_table" "group_4" {
  vpc_id = aws_vpc.group_4.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.group_4.id
  }
}

resource "aws_route_table_association" "a" {
  count = length(var.subnet_cidrs)
  subnet_id = element(aws_subnet.group_4.*.id, count.index)
  route_table_id = aws_route_table.group_4.id
}
