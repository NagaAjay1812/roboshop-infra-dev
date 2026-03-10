resource "aws_security_group_rule" "bastion_internet" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  # target traffic
  security_group_id = local.bastion_sg_id
}

resource "aws_security_group_rule" "bastion_mongodb" {
  type      = "ingress"
  from_port = 22
  to_port   = 22
  protocol  = "tcp"
  # where traffic come from(source)
  source_security_group_id = local.bastion_sg_id
  # target traffic
  security_group_id = local.mongodb_sg_id
}

resource "aws_security_group_rule" "mongodb_catalogue" {
  type      = "ingress"
  from_port = 27017
  to_port   = 27017
  protocol  = "tcp"
  # where traffic come from(source)
  source_security_group_id = local.catalogue_sg_id
  # target traffic
  security_group_id = local.mongodb_sg_id
}

resource "aws_security_group_rule" "mongodb_user" {
  type      = "ingress"
  from_port = 27017
  to_port   = 27017
  protocol  = "tcp"
  # where traffic come from(source)
  source_security_group_id = local.user_sg_id
  # target traffic
  security_group_id = local.mongodb_sg_id
}

resource "aws_security_group_rule" "bastion_redis" {
  type      = "ingress"
  from_port = 22
  to_port   = 22
  protocol  = "tcp"
  # where traffic come from(source)
  source_security_group_id = local.bastion_sg_id
  # target traffic
  security_group_id = local.redis_sg_id
}

resource "aws_security_group_rule" "redis_user" {
  type      = "ingress"
  from_port = 6379
  to_port   = 6379
  protocol  = "tcp"
  # where traffic come from(source)
  source_security_group_id = local.user_sg_id
  # target traffic
  security_group_id = local.redis_sg_id
}

resource "aws_security_group_rule" "redis_cart" {
  type      = "ingress"
  from_port = 6379
  to_port   = 6379
  protocol  = "tcp"
  # where traffic come from(source)
  source_security_group_id = local.cart_sg_id
  # target traffic
  security_group_id = local.redis_sg_id
}
