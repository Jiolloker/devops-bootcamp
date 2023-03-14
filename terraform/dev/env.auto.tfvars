  vpc_name = "devops-dev-vpc"
  vpc_cidr ="10.0.0.0/16"
  vpc_azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
  vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  vpc_enable_nat_gateway = false

  jenkins_instance = {
    "jenkins-server" = {
      ami = "ami-0557a15b87f6559cf"
      instance_type = "t3.medium"
      key_name = "jenkins-keypair"
      monitoring = false
      public_ip = true
    }
  }