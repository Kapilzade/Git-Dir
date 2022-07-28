/*
resource "aws_instance" "web" {
  ami = "${var.ami-id}"
  instance_type = "${var.instance_type_list[0]}" 
  tags = {
    Name = "instance01"
  }
}
*/
resource "aws_instance" "db" {
  ami = "${var.ami-id-map[ubuntu]}"
  instance_type = "${var.instance_type_list[0]}"
  tags = {
    Name = "instance02"
  }
}



