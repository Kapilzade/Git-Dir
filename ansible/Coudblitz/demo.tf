provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "webserver" {
  ami = "ami-02541b8af977f6cdd"  
  instance_type = "t2.micro"
  security_groups = [ "default" ]
  key_name = "californiakey.pem"
}