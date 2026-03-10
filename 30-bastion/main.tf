resource "aws_instance" "bastion" {
  ami           = local.ami_id # we paramatrized
  instance_type = var.instance_type
  subnet_id     = local.public_subnet_ids

  # Reference the security group ID here
  vpc_security_group_ids = [local.bastion_sg_id]
  iam_instance_profile   = aws_iam_instance_profile.bastion.name
  user_data              = file(bastion.sh)

  root_block_device {
    volume_size = 50 # Increase the storage size from 20gb to 50gb
    volume_type = "gp3"

    # Optional: Add tags to the instance for identification
    tags = local.bastion_final_tags
  }
}

# 1. created a role
resource "aws_iam_role" "bastion" {
  name = "RoboShopDevBastion"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    local.common_tags,
    {
      Name = "RoboshopDevBastion"
    }
  )
}

# 2. Attach the permissions

resource "aws_iam_role_policy_attachment" "bastion" {
  role       = aws_iam_role.bastion.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# 3. create instance profile
resource "aws_iam_instance_profile" "bastion" {
  name = "${var.project}-${var.environment}-bastion"
  role = aws_iam_role.bastion.name
}
