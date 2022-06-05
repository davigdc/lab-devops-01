variable "tag_name" {
  description = "Valor das tags do laboratório"
  type        = string
  default     = "lab-devops-01"
}

variable "pvt_key" {
  description = "Caminho da chave privada de acesso ssh"
  type        = string
  default     = "./lab-devops-01.pem"
}