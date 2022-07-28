resource "aws_instance" "web" {
  ami = "${var.ami-id}"
  instance_instance_type = "t2.micro" 
  tags = {
    Name = "instance01"
  }
}






resource "aws_instance" "web" {
    ami = "${var.ami-id}"
    instance_type = "${var.instance-type-list[2]}"
    tags = {
        Name = "instance1"
  }
}