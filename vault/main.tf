provider "vault" {
  address = "http://127.0.0.1:8200"
  #token in cleartext just for testing
  token = "hvs.Xn0bpQlzdDkz7BNpzyJvdUsH"
}
data "vault_generic_secret" "phone_number" {
  path = "secret/app"
}
output "phone_number" {
  value     = data.vault_generic_secret.phone_number.data["phone_number"]
  sensitive = true
}

# you can create resources and pass secrets from vault, like a password, thusly
resource "aws_instance" "app" {
  password = data.vault_generic_secret.phone_number.data["phone_number"]
}