output "id" {
  description = "Microsoft Entra user resource ID."
  value       = azuread_user.this.id
}

output "object_id" {
  description = "Microsoft Entra user object ID."
  value       = azuread_user.this.object_id
}

output "user_principal_name" {
  description = "Microsoft Entra user principal name."
  value       = azuread_user.this.user_principal_name
}

output "display_name" {
  description = "Microsoft Entra user display name."
  value       = azuread_user.this.display_name
}

output "mail_nickname" {
  description = "Microsoft Entra user mail nickname."
  value       = azuread_user.this.mail_nickname
}

output "tenant_id" {
  description = "Microsoft Entra tenant ID used by the AzureAD provider."
  value       = data.azuread_client_config.current.tenant_id
}
