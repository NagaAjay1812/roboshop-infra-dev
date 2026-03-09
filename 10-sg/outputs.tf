output "sg_id" {
  description = "The ID of the SG from module"
  value       = module.sg[*].security_group_id
}
