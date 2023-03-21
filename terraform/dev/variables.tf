variable "vpc_name" {
  type = string
  description = "value for the 'Name' tag of the VPC"
}
  
variable "vpc_cidr" {
  type = string
  description = "CIDR block for the VPC"
}

variable "vpc_azs" {
  type = list(string)
  description = "Availability Zones for the VPC"
}

variable "vpc_private_subnets" {
  type = list(string)
  description = "CIDR blocks for the private subnets"
}

variable "vpc_public_subnets" {
  type = list(string)
  description = "CIDR blocks for the public subnets"
}

variable "vpc_enable_nat_gateway" {
  type = bool
  description = "whether to enable NAT gateways for the private subnets"
}

variable "environment" {
  type = string
  description = "environment name"
  default = "dev"
}

variable "jenkins_server" {
  type = map(object({
    name = string
    ami = string
    instance_type = string
    key_name = string
    monitoring = bool
    public_ip = bool
  }))
}