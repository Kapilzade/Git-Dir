resource "aws_instance" "private_instance" {
    ami = "${var.ami-id-map["rhel"]}"
    instance_type = "${var.instance_type_list[0]}"
    subnet_id = "${aws_subnet.private_subnet.id}"
    tags = {
      "Name" = "private_instance"
      Env = "${var.env}"
    }
  
}

resource "aws_instance" "public_instance" {
    ami = "${var.ami-id-map["rhel"]}"
    instance_type = "${var.instance_type_list[0]}"
    subnet_id = "${aws_subnet.public_subnet.id}"
    tags = {
      "Name" = "public_instance"
      Env = "${var.env}"
    }
  
}