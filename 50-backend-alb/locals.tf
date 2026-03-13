locals {
  backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.value

  common_tags = {
    Name        = var.project
    Environment = var.environment
    Terraform   = "true"
  }
  backend_alb_final_tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-backend_alb"
    },
    var.backend_tags
  )
  #private subnet in 1a availibility zone
  private_subnet_id = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
}
