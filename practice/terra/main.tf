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
  ami = "${var.ami-id-map["rhel"]}"
  instance_type = "${var.instance_type_list[0]}"
  tags = {
    Name = "instance02"
  }
  key_name = "${var.instance_key}"
  user_data = <<EOF
    yum install httpd -y
    systemctl start httpd
    systemctl enable httpd
    EOF
  
  
  associate_public_ip_address = "${var.public_ip_enable}"
}

output "ami-id-print" {
  value = "${var.ami-id-map["rhel"]}"
  
}

output "pri_ip" {
  value = "${aws_instance.db.private_ip}"
  
}

data "aws_subnet" "subnet"{
  tags = {
    "Name" = "mysubnet"
  }
  }

output "subnetid" {
   value = "${data.aws_subnet.subnet.id}"  
}
