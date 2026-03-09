resource "aws_instance" "mongodb" {
  ami           = local.ami_id # we paramatrized
  instance_type = var.instance_type
  subnet_id     = local.database_subnet_ids

  # Reference the security group ID here
  vpc_security_group_ids = [local.mongodb_sg_id]

  # Optional: Add tags to the instance for identification
  tags = local.mongodb_final_tags
}

resource "terraform_data" "bootstrap" {
  triggers_replace = [
    aws_instance.mongodb.id

  ]
  connection {
    type     = "ssh"
    user     = "ec2-user" # or 'ec2-user', etc.
    password = "DevOps321"
    host     = aws_instance.mongodb.private_ip
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh" # we are copying the script in mongodb server
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootrsap.sh", # giving execute access to that script
      "sudo sh /tmp/bootstrap.sh"  # now we are executing the script
    ]
  }
}
