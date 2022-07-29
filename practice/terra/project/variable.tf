variable "env" {
  default = "test"
}


variable "ami-id-map" {
    type = map
    default = {  
      ubuntu = "ami-02f3416038bdb17fb"
      rhel = "ami-092b43193629811af"
      awsmachine = "ami-02d1e544b84bf7502"
    }
}

variable "instance_type_list" {
    default = ["t2.micro","t2.small"]
  
}