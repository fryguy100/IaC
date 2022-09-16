locals {
  server_name  = var.identity
  service_name = "Automation"
  app_team     = "Cloud Team"
  createdby    = "terraform"
  application = "front end web server"
}
locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Name      = local.server_name
    App       = local.application
    Service   = local.service_name
    AppTeam   = local.app_team
    CreatedBy = local.createdby
  }
}


resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name
  tags                   = local.common_tags
}