#
#provider "aws" {
    #region = "us-west-1"
    access_key = "key"
    secret_key = "key"
 
}
#resource "aws_instance" "webserver" {
  #ami = "ami-02541b8af977f6cdd"
  instance_type = "t2.micro"
  tags = {
    "Name" = "instance1"
  }
}
##