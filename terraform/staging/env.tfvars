  vpc_name = "devops-staging-vpc"
  vpc_cidr ="10.1.0.0/16"
  vpc_azs = ["eu-east-1a", "eu-east-1b", "eu-east-1c"]
  vpc_private_subnets = ["10.1.1.0/24", "10.2.2.0/24", "10.4.3.0/24"]
  vpc_enable_nat_gateway = false