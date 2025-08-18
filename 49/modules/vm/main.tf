resource "aws_instance" "example" {
  ami           = var.ami # Replace with a valid AMI ID
  instance_type = var.instance_type

  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.vpc_security_group_id]

  tags = {
    Name = "${var.instance_name}-ua5"
  }
}