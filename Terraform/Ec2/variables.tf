variable "ami" {
  default = "ami-0f540e9f488cfa27d"
}

variable "type" {
  default = "t2.micro"

}

variable "access" {
  access_key = var.access

}

variable "secret" {
  secret_key = var.secret
}

variable "vpc_id" {
  default = "vpc-0f6156e3671cf91fb"

}