locals {
  ami_id        = var.ami_id
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
  redis_sg_id   = data.aws_ssm_parameter.redis_sg_id.value

  common_tags = {
    Name        = var.project
    Environment = var.environment
    Terraform   = "true"
  }
  mongodb_final_tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-mongodb"
    },
    var.mongodb_tags
  )
  #public subnet in 1a availibility zone
  database_subnet_ids = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]
}
