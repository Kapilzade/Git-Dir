provider "aws" {
region = "us-east-2"
}
  resource "aws_instance" "app-server" {
  name = "app_server"
  ami =  "ami-02d1e544b84bf7502s"
  instance_type = "t2.micro"
  key_name = "flame"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
}