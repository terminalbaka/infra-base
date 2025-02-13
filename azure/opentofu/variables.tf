variable "resource_group_name" {
  type        = string
  description = "Nome do grupo de recursos"
}

variable "location" {
  type        = string
  description = "Localização dos recursos na Azure"
  default     = "eastus2"
}

variable "postgres_server_name" {
  type        = string
  description = "Nome do servidor PostgreSQL"
}

variable "postgres_admin_username" {
  type        = string
  description = "Nome do usuário administrador do PostgreSQL"
  sensitive = true
}

variable "postgres_admin_password" {
  type        = string
  description = "Senha do usuário administrador do PostgreSQL"
  sensitive   = true
}

variable "my_ip_address" {
  type        = string
  description = "Seu endereço IP para regra de firewall"
}

variable "postgres_sku_name" {
  type        = string
  description = "SKU do servidor PostgreSQL"
  default     = "B_Standard_B1ms"
}

variable "postgres_storage_mb" {
  type        = number
  description = "Tamanho do storage em MB"
  default     = 32768 # 32GB
}

variable "postgres_version" {
  type        = string
  description = "Versão do PostgreSQL"
  default     = "11"
}

variable "subscription_id" {
  type        = string
  description = "ID da subscription da Azure"
  sensitive   = true
}

variable "location_eastus" {
  type = string
  default = "eastus"
}

variable "location_eastus2" {
  type = string
  default = "eastus2"
}

variable "client_id" {
  type = string
  sensitive = true
}

variable "client_secret" {
  type = string
  sensitive = true
}

variable "tenant_id" {
  type = string
  sensitive = true
}