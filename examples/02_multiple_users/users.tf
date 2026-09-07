locals {
  users = {
    user01 = {
      user_principal_name = "user01@${var.user_principal_name_suffix}"
      display_name        = "User 01"
      mail_nickname       = "user01"
      given_name          = "FoggyKitchen"
      surname             = "User 01"
      job_title           = "Example Member"
      department          = "FoggyKitchen Labs"
    }
    user02 = {
      user_principal_name = "user02@${var.user_principal_name_suffix}"
      display_name        = "User 02"
      mail_nickname       = "user02"
      given_name          = "FoggyKitchen"
      surname             = "User 02"
      job_title           = "Example Member"
      department          = "FoggyKitchen Labs"
    }
    user03 = {
      user_principal_name = "user03@${var.user_principal_name_suffix}"
      display_name        = "User 03"
      mail_nickname       = "user03"
      given_name          = "FoggyKitchen"
      surname             = "User 03"
      job_title           = "Example Member"
      department          = "FoggyKitchen Labs"
    }
  }
}

module "entra_users" {
  source   = "../../"
  for_each = local.users

  user_principal_name = each.value.user_principal_name
  display_name        = each.value.display_name
  mail_nickname       = each.value.mail_nickname
  password            = var.password
  given_name          = each.value.given_name
  surname             = each.value.surname
  job_title           = each.value.job_title
  department          = each.value.department
}
