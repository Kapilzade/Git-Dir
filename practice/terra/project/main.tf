resource "aws_vpc" "my_vpc" {
    cidr_block = "192.168.0.0/16"
    tags = {
        Name = "my_vpc"
        Env = "${var.env}"


    }  
}

resource "aws_subnet" "private_subnet" {
  vpc_id = "${aws_vpc.my_vpc}"
  cidr_block = "192.168.0.0/20"
  tags = {
    Name = "private_subnet"
    Env = "${var.env}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = "${aws_vpc.my_vpc}"
  cidr_block = "192.168.0.0/20"
  tags = {
    "Name" = "public_subnet"
    Env = "${var.env}"
  }
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.my_vpc.id}"
    tags = {
      "Name" = "myigw"
       Env = "${var.env}"
    }

  
}

resource "aws_default_route_table" "default_rt" {
  default_route_table_id = "${aws_vpc.my_vpc.default_route_table_id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
tags = {
  "Name" = "default_rt"
   Env = "${var.env}"
}
}