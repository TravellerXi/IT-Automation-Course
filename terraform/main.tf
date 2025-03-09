resource "aws_security_group" "terraform_demo_security_group" {
  description = "Allow port 22, 80 and 443"
  dynamic "ingress" {
    for_each = var.ALLOWED_PORTS
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] 
    }
  } 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  tags = {
    Name = var.TAGS_SecurityGroups
  }
}
resource "aws_instance" "terraform_demo_instance" {
  
  ami = lookup(var.AMI, var.REGION)
  instance_type = var.INSTANCE_TYPE
  key_name = var.KEY_NAME
  tags = {
    Name = var.TAGS_Instance
  }
  count = var.COUNT
  vpc_security_group_ids = [aws_security_group.terraform_demo_security_group.id]
}
