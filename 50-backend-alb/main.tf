resource "aws_lb" "main" {
  name               = "backend-alb-${var.project}-${var.environment}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.backend_alb_sg_id.id]
  subnets            = local.private_subnet_id

  enable_deletion_protection = false


  tags = local.backend_alb_final_tags
}
