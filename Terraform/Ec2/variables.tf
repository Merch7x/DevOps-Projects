variable "ami" {
  default = "ami-0f540e9f488cfa27d"
}

variable "type" {
  default = "t2.micro"

}

variable "access_key" {
  description = "Aws Acess Key"

}

variable "secret_key" {
  description = "Aws secret Key"
}

variable "vpc_id" {
  default = "vpc-0f6156e3671cf91fb"

}