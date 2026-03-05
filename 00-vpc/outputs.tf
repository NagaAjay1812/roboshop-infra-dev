output "vpc_id" {
  value = module.vpc.main_vpc_id
}

output "public_sub_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_sub_ids" {
  value = module.vpc.private_subnet_ids
}

output "database_sub_ids" {
  value = module.vpc.database_subnet_ids
}





