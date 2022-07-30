resource "aws_launch_configuration" "lc1" {
  name          = "home_lc"
  image_id      = "${var.ami-id-map["rhel"]}"
  instance_type = "${var.instance_type_list[0]}"
  security_groups = ["sg-029011d94639a2680"]
  key_name = "flame"
  user_data = <<EOF
     yum install httpd -y
     systemctl start httpd
     systemctl enable httpd
     echo "<H1>Hello Domya" > /var/www/html/index.html
     EOF
 
}

resource "aws_launch_configuration" "lc2" {
  name          = "mobile_lc"
  image_id      = "${var.ami-id-map["rhel"]}"
  instance_type = "${var.instance_type_list[0]}"
  security_groups = ["sg-029011d94639a2680"]
  key_name = "flame"
  user_data = <<EOF
     yum install httpd -y
     systemctl start httpd
     systemctl enable httpd
     echo "<H1>Hello Domya on mobile" > /var/www/html/mobile/index.html
     EOF

}

resource "aws_launch_configuration" "lc3" {
  name          = "laptop_lc"
  image_id      = "${var.ami-id-map["rhel"]}"
  instance_type = "${var.instance_type_list[0]}"
  security_groups = ["sg-029011d94639a2680"]
  key_name = "flame"
  user_data = <<EOF
     yum install httpd -y
     systemctl start httpd
     systemctl enable httpd
     echo "<H1>Hello Domya on laptop" > /var/www/html/laptop/index.html
     EOF
 
}

resource "aws_autoscaling_group" "AS1" {
    name = "home_asg"
    launch_configuration = "${aws_launch_configuration.lc1.name}"
    max_size = 3
    min_size = 1
    desired_capacity = 2
    vpc_zone_identifier = ["${aws_subnet.public_subnet.id}" ,"${aws_subnet.private_subnet.id}"]
    
}

resource "aws_autoscaling_group" "AS2" {
    name = "mobile_asg"
    launch_configuration = "${aws_launch_configuration.lc2.name}"
    max_size = 3
    min_size = 1
    desired_capacity = 2
    vpc_zone_identifier = ["${aws_subnet.public_subnet.id}" ,"${aws_subnet.private_subnet.id}"]
    
}


resource "aws_autoscaling_group" "AS3" {
    name = "laptop_asg"
    launch_configuration = "${aws_launch_configuration.lc3.name}"
    max_size = 3
    min_size = 1
    desired_capacity = 2
    vpc_zone_identifier = ["${aws_subnet.public_subnet.id}" ,"${aws_subnet.private_subnet.id}"]
 
}
