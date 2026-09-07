output "user_object_ids" {
  description = "Microsoft Entra user object IDs keyed by example user."
  value = {
    for key, user in module.entra_users : key => user.object_id
  }
}

output "user_principal_names" {
  description = "Microsoft Entra user principal names keyed by example user."
  value = {
    for key, user in module.entra_users : key => user.user_principal_name
  }
}

output "member_object_ids" {
  description = "Microsoft Entra user object IDs ready to pass into terraform-az-fk-entra-group member_object_ids."
  value = [
    for user in module.entra_users : user.object_id
  ]
}
