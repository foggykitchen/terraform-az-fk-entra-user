data "azuread_client_config" "current" {}

resource "azuread_user" "this" {
  user_principal_name = var.user_principal_name
  display_name        = var.display_name
  mail_nickname       = var.mail_nickname
  password            = var.password

  account_enabled         = var.account_enabled
  force_password_change   = var.force_password_change
  given_name              = var.given_name
  surname                 = var.surname
  job_title               = var.job_title
  department              = var.department
  company_name            = var.company_name
  usage_location          = var.usage_location
  other_mails             = var.other_mails
  show_in_address_list    = var.show_in_address_list
  disable_strong_password = var.disable_strong_password
}
