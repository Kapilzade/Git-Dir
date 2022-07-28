resource "aws_instance" "web" {
  ami = "${var.ami-id}"
  instance_type = "${var.instance_type_list[2]}" 
  tags = {
    Name = "instance01"
  }
}


