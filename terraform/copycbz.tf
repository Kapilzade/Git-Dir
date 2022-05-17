provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web-server" {
  ami = "ami-09d56f8956ab235b3"
  instance_type = "t2.micro"
  security_groups = ["default"]
  key_name = "halland"
}
