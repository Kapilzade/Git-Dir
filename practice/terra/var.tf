variable "ami-id" {
  type = string
  default = "ami-02d1e544b84bf7502"
}


variable "instance_type_list" {
  type = "list"
  default = ["t2.micro","t3.small","t3.micro"]
}