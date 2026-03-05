module "vpc" {                                                                                # I'm using vpc module the source will be available below location
  source              = "git::https://github.com/NagaAjay1812/terraform-aws-vpc.git?ref=main" # here we are ferfring from local noy from git -> i will refer from git give like this git::https?ref=main
  project             = "roboshop"
  environment         = "dev"
  is_peering_required = "false"
}
