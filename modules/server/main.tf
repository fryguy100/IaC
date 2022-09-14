
resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name
  tags = {
    "Identity"    = var.identity
    "Name"        = var.identity
    "Environment" = "Training"
  }
}