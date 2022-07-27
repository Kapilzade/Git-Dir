provider "aws" {
region = "us-east-2"
}
  resource "aws_instance" "app-server" {
  tags = {
    "Name" = "demo"
  }
  ami =  "ami-02d1e544b84bf7502"
  instance_type = "t2.micro"
  key_name = "flame"
  availability_zone = "us-east-2a"
  security_groups = "launch-wizard-2"

  }