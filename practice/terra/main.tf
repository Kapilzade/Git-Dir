resource "aws_instance" "web" {
    ami = "${var.ami-id}"
    instance_type = "${var.instance-type-list[2]}"
    tags = {
        Name = "instance1"
  }
}