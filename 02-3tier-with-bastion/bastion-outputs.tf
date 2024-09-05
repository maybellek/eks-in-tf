output "bastion_public_instance_id" {
  description = "ID of Bastion Server"
  value = module.bastion_public.id
}

output "bastion_eip" {
  description = "Elastic IP address of Bastion Server"
  value = aws_eip.bastion_eip.public_ip
}