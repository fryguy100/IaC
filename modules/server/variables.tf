variable "ami" {}
variable "subnet_id" {}
variable "vpc_security_group_ids" {
  type = list(any)
}
variable "identity" {}
variable "key_name" {}
variable "private_key" {}