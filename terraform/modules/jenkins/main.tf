
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
}
data "aws_security_group" "jenkins-sg" {
  name   = "jenkins-sg"
  vpc_id = data.aws_vpc.devops-vpc.id
}
module "ec2_instance" {
    source = "terraform-aws-modules/ec2-instance/aws"
    version = "~> 3.0"

    name = var.name
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [data.aws_security_group.jenkins-sg.id]
    monitoring = var.monitoring
    subnet_id = var.subnet_id
    associate_public_ip_address = var.public_ip
    tags = {
        Terraform = "true"
        Environment = var.environment
    }
}