variable "user_principal_name_suffix" {
  description = "Verified Microsoft Entra domain suffix for example users."
  type        = string
}

variable "password" {
  description = "Initial Microsoft Entra user password used by all example users."
  type        = string
  sensitive   = true
}
