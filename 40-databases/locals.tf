locals {
  ami_id        = var.ami_id
  bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value

  common_tags = {
    Name        = var.project
    Environment = var.environment
    Terraform   = "true"
  }
  bastion_final_tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-bastion"
    },
    var.bastion_tags
  )
  #public subnet in 1a availibility zone
  public_subnet_ids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
}
