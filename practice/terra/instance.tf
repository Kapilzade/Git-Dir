resource "aws_instance" "app-server" {
  name = "app_server"
  ami =  "ami-0fa49cc9dc8d62c84"
  instance_type = "t2.micro"
  key_name = "flame"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
}