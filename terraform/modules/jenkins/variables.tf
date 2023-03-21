variable "name" {
    type = string
    default = "jenkins"
}
variable "ami" {
    type = string
    default = "ami-0c2b8ca1dad447f8a"
}
  
variable "instance_type" {
    type = string
    default = "t2.micro"
}
variable "key_name" {
    type = string
    default = "jenkins"
}
variable "monitoring" {
    type = bool
    default = false
}
variable "subnet_id" {
    type = string
}
variable "public_ip" {
    type = bool
    default = true
}
variable "environment" {
    type = string
    default = "dev"
}
variable "security_group_ids" {
    type = list(string)
}