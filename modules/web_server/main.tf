
locals {
  service_name = "Web-App"
  app_team     = "Cloud Team"
  createdby    = "terraform"
}

resource "aws_instance" "web" {
  ami                         = var.ami
  instance_type               = var.size
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = true
  key_name                    = var.key_name
  connection {
    user        = var.user
    private_key = var.private_key
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo rm -rf /tmp",
      "sudo git clone https://github.com/hashicorp/demo-terraform-101 /tmp",
      "sudo sh /tmp/assets/setup-web.sh",
    ]
  }

  tags = {
    "Identity"    = var.identity
    "Name"        = var.identity
    "Environment" = "Training"
    "Service"     = local.service_name
    "App Team"    = local.app_team
    "CreatedBy"   = local.createdby
  }
}
