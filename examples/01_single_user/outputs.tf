output "user_id" {
  description = "Microsoft Entra user resource ID."
  value       = module.entra_user.id
}

output "user_object_id" {
  description = "Microsoft Entra user object ID."
  value       = module.entra_user.object_id
}

output "user_principal_name" {
  description = "Microsoft Entra user principal name."
  value       = module.entra_user.user_principal_name
}

output "tenant_id" {
  description = "Microsoft Entra tenant ID used by the AzureAD provider."
  value       = module.entra_user.tenant_id
}
