output "vpc_id" {
  value = module.vpc.vpc_id
}
output "subnet_ids" {
  value = module.vpc.vpc_private_subnets
}