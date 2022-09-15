output "environment" {
  value = var.environment
}
output "public_ip" {
  value = module.server.public_ip
}
output "public_dns" {
  value = module.server.public_dns
}
output "server_size" {
  value = module.server.size
}

output "public_ip_web_server" {
  value = module.server_web_server.public_ip
}
output "public_dns_web_server" {
  value = module.server_web_server.public_dns
}
output "web_server_size" {
  value = module.server_web_server.size
}

output "asg_group_size" {
  value = module.autoscaling.autoscaling_group_max_size
}

output "s3_bucket_name" {
  value = module.s3-bucket.s3_bucket_bucket_domain_name
}