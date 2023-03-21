
data "aws_vpc" "devops-vpc" {
  filter {
    name   = "tag:Name"
    values = ["devops-dev*"]
  }
}
module "security-group" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "4.17.1"

    name = "jenkins-sg"
    vpc_id = data.aws_vpc.devops-vpc.id
    description = "Security group for Jenkins"
    ingress_cidr_blocks = ["190.231.142.81/32"]
    ingress_rules = ["ssh-tcp"]
    ingress_with_cidr_blocks = [
      {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        description = "Jenkins-web"
        cidr_blocks = "190.231.142.81/32"
      },
      {
        from_port   = 50000
        to_port     = 50000
        protocol    = "tcp"
        description = "Jenkins-agent"
        cidr_blocks = "190.231.142.81/32"
        },
    ]
    egress_rules = ["all-all"]
    tags = {
        Terraform = "true"
        Environment = var.environment
    }
}
module "ec2_instance" {
    source = "terraform-aws-modules/ec2-instance/aws"
    version = "~> 3.0"

    name = var.name
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [module.security-group.security_group_id]
    monitoring = var.monitoring
    subnet_id = var.subnet_id
    associate_public_ip_address = var.public_ip
    user_data = <<-EOF
    #!/bin/bash
    sudo apt-get install -y linux-generic
    sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg 
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update -y
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    EOF
    tags = {
        Terraform = "true"
        Environment = var.environment
    }
}