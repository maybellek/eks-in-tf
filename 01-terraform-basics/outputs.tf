
output "instance_public_ip" {
  description = "Public IPs"
  #value = aws_instance.demo_instance[*].public_ip
  value = [for ins in  aws_instance.demo_instance: ins.public_ip]
}

output "instance_public_dns" {
  description = "Public DNS"
  value = [for ins in  aws_instance.demo_instance: ins.public_dns]
}

output "instance_public_dns_map" {
  description = "Public DNS"
  value = { for az, ins in aws_aws_instance.demo_instance: az => ins.public_dns}
}