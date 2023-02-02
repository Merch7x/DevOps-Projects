variable "ami" {
  default = "ami-0f540e9f488cfa27d"
}

variable "type" {
  default = "t2.micro"

}

variable "access_key" {
  type = string
  nullable = True
}

variable "secret_key" {
  type = string
  nullable = True
}

variable "vpc_id" {
  default = "vpc-0f6156e3671cf91fb"

}