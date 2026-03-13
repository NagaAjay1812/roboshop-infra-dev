resource "aws_instance" "mongodb" {
  ami           = local.ami_id # we paramatrized
  instance_type = var.instance_type
  subnet_id     = local.database_subnet_ids

  # Reference the security group ID here
  vpc_security_group_ids = [local.mongodb_sg_id]

  # Optional: Add tags to the instance for identification
  tags = local.mongodb_final_tags
}

resource "terraform_data" "bootstrap_mongodb" {
  triggers_replace = [
    aws_instance.mongodb.id

  ]
  connection {
    type     = "ssh"
    user     = "ec2-user" # or 'ec2-user', etc.
    password = "DevOps321"
    host     = aws_instance.mongodb.private_ip
    timeout  = "5m"
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh" # we are copying the script in mongodb server
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 60",
      "chmod +x /tmp/bootstrap.sh",       # giving execute access to that script
      "sudo sh /tmp/bootstrap.sh mongodb" # now we are executing the script and we are passing mongobd component
    ]
  }
}

resource "aws_instance" "redis" {
  ami           = local.ami_id # we paramatrized
  instance_type = var.instance_type
  subnet_id     = local.database_subnet_ids

  # Reference the security group ID here
  vpc_security_group_ids = [local.redis_sg_id]

  # Optional: Add tags to the instance for identification
  tags = local.redis_final_tags
}

resource "terraform_data" "bootstrap_redis" {
  triggers_replace = [
    aws_instance.redis.id

  ]
  connection {
    type     = "ssh"
    user     = "ec2-user" # or 'ec2-user', etc.
    password = "DevOps321"
    host     = aws_instance.redis.private_ip
    timeout  = "5m"
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh" # we are copying the script in mongodb server
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 60",
      "chmod +x /tmp/bootstrap.sh",     # giving execute access to that script
      "sudo sh /tmp/bootstrap.sh redis" # now we are executing the script and we are passing redis component
    ]
  }
}

resource "aws_instance" "mysql" {
  ami           = local.ami_id # we paramatrized
  instance_type = var.instance_type
  subnet_id     = local.database_subnet_ids

  # Reference the security group ID here
  vpc_security_group_ids = [local.mysql_sg_id]

  # Optional: Add tags to the instance for identification
  tags = local.mysql_final_tags
}

resource "terraform_data" "bootstrap_mysql" {
  triggers_replace = [
    aws_instance.mysql.id

  ]
  connection {
    type     = "ssh"
    user     = "ec2-user" # or 'ec2-user', etc.
    password = "DevOps321"
    host     = aws_instance.mysql.private_ip
    timeout  = "5m"
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh" # we are copying the script in mongodb server
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 60",
      "chmod +x /tmp/bootstrap.sh",     # giving execute access to that script
      "sudo sh /tmp/bootstrap.sh mysql" # now we are executing the script and we are passing redis component
    ]
  }
}

resource "aws_instance" "rabbitmq" {
  ami           = local.ami_id # we paramatrized
  instance_type = var.instance_type
  subnet_id     = local.database_subnet_ids

  # Reference the security group ID here
  vpc_security_group_ids = [local.rabbitmq_sg_id]

  # Optional: Add tags to the instance for identification
  tags = local.rabbitmq_final_tags
}

resource "terraform_data" "bootstrap_rabbitmq" {
  triggers_replace = [
    aws_instance.rabbitmq.id

  ]
  connection {
    type     = "ssh"
    user     = "ec2-user" # or 'ec2-user', etc.
    password = "DevOps321"
    host     = aws_instance.rabbitmq.private_ip
    timeout  = "5m"
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh" # we are copying the script in mongodb server
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 60",
      "chmod +x /tmp/bootstrap.sh",        # giving execute access to that script
      "sudo sh /tmp/bootstrap.sh rabbitmq" # now we are executing the script and we are passing redis component
    ]
  }
}

