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