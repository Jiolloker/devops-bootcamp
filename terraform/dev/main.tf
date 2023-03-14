module "vpc" {
  source = "../modules/vpc"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  vpc_azs = var.vpc_azs
  vpc_private_subnets = var.vpc_private_subnets
  vpc_enable_nat_gateway = var.vpc_enable_nat_gateway
}
module "jenkins" {
  source = "../modules/jenkins"

  for_each = var.jenkins_instance

  jenkins-name = each.key
  ami = each.value.ami
  instance_type = each.value.instance_type
  key_name = each.value.key_name
  monitoring = each.value.monitoring
  subnet_id = module.vpc.vpc_private_subnets[0]
  public_ip = each.value.public_ip
}