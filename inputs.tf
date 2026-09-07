variable "user_principal_name" {
  description = "Microsoft Entra user principal name."
  type        = string

  validation {
    condition     = length(trimspace(var.user_principal_name)) > 0 && can(regex("@", var.user_principal_name))
    error_message = "user_principal_name must be a non-empty UPN containing '@'."
  }
}

variable "display_name" {
  description = "Microsoft Entra user display name."
  type        = string

  validation {
    condition     = length(trimspace(var.display_name)) > 0
    error_message = "display_name must not be empty."
  }
}

variable "mail_nickname" {
  description = "Microsoft Entra user mail nickname."
  type        = string

  validation {
    condition     = length(trimspace(var.mail_nickname)) > 0
    error_message = "mail_nickname must not be empty."
  }
}

variable "password" {
  description = "Initial Microsoft Entra user password."
  type        = string
  sensitive   = true

  validation {
    condition     = length(var.password) >= 8
    error_message = "password must be at least 8 characters long."
  }
}

variable "account_enabled" {
  description = "Whether the Microsoft Entra user account is enabled."
  type        = bool
  default     = true
}

variable "force_password_change" {
  description = "Whether the user must change the password at next sign-in."
  type        = bool
  default     = true
}

variable "given_name" {
  description = "Optional given name for the Microsoft Entra user."
  type        = string
  default     = null
}

variable "surname" {
  description = "Optional surname for the Microsoft Entra user."
  type        = string
  default     = null
}

variable "job_title" {
  description = "Optional job title for the Microsoft Entra user."
  type        = string
  default     = null
}

variable "department" {
  description = "Optional department for the Microsoft Entra user."
  type        = string
  default     = null
}

variable "company_name" {
  description = "Optional company name for the Microsoft Entra user."
  type        = string
  default     = null
}

variable "usage_location" {
  description = "Optional two-letter country code for Microsoft services usage location."
  type        = string
  default     = null
}

variable "other_mails" {
  description = "Optional additional email addresses for the Microsoft Entra user."
  type        = set(string)
  default     = []
}

variable "show_in_address_list" {
  description = "Whether the Microsoft Entra user should be visible in address lists."
  type        = bool
  default     = true
}

variable "disable_strong_password" {
  description = "Whether to disable strong password requirements for the Microsoft Entra user."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Reserved for consistency with FoggyKitchen module interfaces. Microsoft Entra users do not support Azure resource tags."
  type        = map(string)
  default     = {}
}
