variable "aws_region" {
  type = string
  # default     = "us-east-1"
  description = "Região onde será criada a instância"
}

variable "aws_profile" {
  type = string
  # default     = "terraform"
  description = "Profile do terraform que está sendo utilizado"
}

variable "aws_ami" {
  type = string
  # default     = "ami-0e731c8a588258d0d"
  description = "Imagem da instância"
}

variable "instance_type" {
  type = string
  # default     = "t3.micro"
  description = "Tipo da Instância"
}

variable "instance_tags" {
  type = map(string)
  default = {
    Name    = "aws-instance"
    Project = "Aplicando Terraform"
  }
  description = "Tags da instância"
}

variable "number_instances_cp" {
  type        = number
  description = "Numero de instancias"
  default     = 1
}

variable "number_instances_worker" {
  type        = number
  description = "Numero de instancias"
  default     = 2
}