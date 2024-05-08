variable "location" {
  description = "Região onde os recursos serão criados na Azure"
  type = string
  default = "West Europe"
}

variable "account_tier" {
  description = "Tier da Storage na Azure"
  type = string
  default = "Standard"
}

variable "account_replication_type" {
  description = "Tipo de replicação de dados da Storage Azure"
  type = string
  default = "LRS"
}