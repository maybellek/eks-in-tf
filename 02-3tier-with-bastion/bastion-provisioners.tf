#Copy pem kep from local machine to the bastion

resource "null_resource" "copy_pem_key" {
    depends_on = [ module.bastion_public ]
    connection {
      type = "ssh"
      host = aws_eip.bastion_eip.public_ip
      user = "ec2-user"
      password = ""
      private_key = file("private-key/terraform-key.pem")
    }

    provisioner "file" {
      source = "private-key/terraform-key.pem"
      destination = "/tmp/terraform-key.pem"
    }

    provisioner "remote-exec" {
      inline = [ 
        "sudo chmod 400 /tmp/terraform-key.pem"
       ]
    }

    provisioner "local-exec" {
      command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
      working_dir = "local-exec-output"
    }
}