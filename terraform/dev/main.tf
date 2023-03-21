module "vpc" {
  source = "../modules/vpc"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  vpc_azs = var.vpc_azs
  vpc_private_subnets = var.vpc_private_subnets
  vpc_public_subnets = var.vpc_public_subnets
  vpc_enable_nat_gateway = var.vpc_enable_nat_gateway
}


module "jenkins" {
  source = "../modules/jenkins"
  
  for_each = var.jenkins_server
  
  name = each.value.name
  ami = each.value.ami
  instance_type = each.value.instance_type
  key_name = each.value.key_name
  subnet_id = module.vpc.public_subnets[0]
  monitoring = each.value.monitoring
  environment = var.environment
}