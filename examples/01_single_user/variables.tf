variable "user_principal_name" {
  description = "Microsoft Entra user principal name."
  type        = string
}

variable "display_name" {
  description = "Microsoft Entra user display name."
  type        = string
  default     = "FoggyKitchen User 01"
}

variable "mail_nickname" {
  description = "Microsoft Entra user mail nickname."
  type        = string
  default     = "fk-user-01"
}

variable "password" {
  description = "Initial Microsoft Entra user password."
  type        = string
  sensitive   = true
}
