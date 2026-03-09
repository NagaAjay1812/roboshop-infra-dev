module "sg" {
  count       = length(var.sg_names)
  source      = "../../terraform-aws-sg" # here we are refering from local noy from git -> i will refer from git give like this git::https?ref=main
  project     = var.project
  environment = var.environment
  sg_name     = var.sg_names[count.index]
  vpc_id      = local.vpc_id

}
