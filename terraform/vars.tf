variable "AMI" {
  type = map(string)
  default = {
    us-east-1 = "ami-0dfcb1ef8550277af"
    us-east-2 = "ami-0cc87e5027adcdca8"
  }
}

variable "REGION" {
  default = "us-east-1"
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "KEY_NAME" {
  default = "vockey"
}

variable "TAGS_Instance" {
  default = "terraform_demo_instance"
}
variable "TAGS_SecurityGroups" {
  default = "terraform_demo_security_group"
}

variable "COUNT" {
  default = "1"
}

variable "ALLOWED_PORTS" {
  type    = list(number)
  default = [22, 80, 443] 
}