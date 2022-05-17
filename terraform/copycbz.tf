provider "aws" {
    region = "us-west-1"
    access_key = "AKIAT464LUR5IKVUEAPR"
    secret_key = "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"
 
}
resource "aws_instance" "webserver" {
  ami = "ami-02541b8af977f6cdd"
  instance_type = "t2.micro"
  tags = {
    "Name" = "instance1"
  }
}