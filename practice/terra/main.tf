resource "aws_instance" "web" {
    ami = "${var.ami-id}"
    instance_type = t2.micro
    tags = {
        Name = "instance1"
}
}