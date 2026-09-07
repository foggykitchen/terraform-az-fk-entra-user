# terraform-az-fk-entra-user

This repository contains a reusable Terraform / OpenTofu module and progressive examples for deploying **Microsoft Entra users**.

It is part of the [FoggyKitchen.com training ecosystem](https://foggykitchen.com) and is designed as a small, composable identity layer for Azure examples that need user principals.

Support expectations are documented in [SUPPORT.md](SUPPORT.md).

---

## Purpose

The goal of this module is to provide a clear, educational, and architecture-aware reference implementation for Microsoft Entra users:

- Focused on Entra user lifecycle
- Explicit initial password handling
- Designed to compose with:
  - `terraform-az-fk-entra-group` for group membership
  - `terraform-az-fk-rbac` for Azure resource role assignments
  - application modules that need user object IDs

This is not a full IAM framework or policy engine.
It is a learning-first, building-block module.

---

## What the module does

The module creates:

- One Microsoft Entra user
- A user principal name
- A display name and mail nickname
- Optional profile metadata such as given name, surname, job title, department, and company name

The module intentionally does not create:

- Microsoft Entra groups
- Azure role assignments
- Azure resources such as Resource Groups, databases, Key Vaults, or VNets
- Service principals
- Applications
- Conditional Access policies
- Privileged Identity Management settings
- Password rotation workflows

Each of those concerns belongs in its own dedicated module or workflow layer.

---

## Repository Structure

```text
terraform-az-fk-entra-user/
├── examples/
│   ├── 01_single_user/
│   ├── 02_multiple_users/
│   └── README.md
├── main.tf
├── inputs.tf
├── outputs.tf
├── versions.tf
├── LICENSE
├── SUPPORT.md
└── README.md
```

---

## Example Usage

```hcl
module "example_user" {
  source = "git::https://github.com/foggykitchen/terraform-az-fk-entra-user.git?ref=v0.1.0"

  user_principal_name = "fk-user-01@example.com"
  display_name        = "FoggyKitchen User 01"
  mail_nickname       = "fk-user-01"
  password            = var.initial_password
}
```

The user object ID can be passed to modules that support Entra principals or group membership:

```hcl
module "example_group" {
  source = "git::https://github.com/foggykitchen/terraform-az-fk-entra-group.git?ref=v0.1.0"

  display_name = "fk-example-members"

  members = [
    module.example_user.object_id
  ]
}
```

---

## Inputs

| Input | Description | Default |
|-------|-------------|---------|
| `user_principal_name` | Microsoft Entra user principal name | n/a |
| `display_name` | Microsoft Entra user display name | n/a |
| `mail_nickname` | Microsoft Entra user mail nickname | n/a |
| `password` | Initial Microsoft Entra user password | n/a |
| `account_enabled` | Whether the Microsoft Entra user account is enabled | `true` |
| `force_password_change` | Whether the user must change the password at next sign-in | `true` |
| `given_name` | Optional given name for the Microsoft Entra user | `null` |
| `surname` | Optional surname for the Microsoft Entra user | `null` |
| `job_title` | Optional job title for the Microsoft Entra user | `null` |
| `department` | Optional department for the Microsoft Entra user | `null` |
| `company_name` | Optional company name for the Microsoft Entra user | `null` |
| `usage_location` | Optional two-letter country code for Microsoft services usage location | `null` |
| `other_mails` | Optional additional email addresses for the Microsoft Entra user | `[]` |
| `show_in_address_list` | Whether the Microsoft Entra user should be visible in address lists | `true` |
| `disable_strong_password` | Whether to disable strong password requirements for the Microsoft Entra user | `false` |
| `tags` | Reserved for consistency with FoggyKitchen module interfaces; Entra users do not support Azure tags | `{}` |

---

## Outputs

| Output | Description |
|--------|-------------|
| `id` | Microsoft Entra user resource ID |
| `object_id` | Microsoft Entra user object ID |
| `user_principal_name` | Microsoft Entra user principal name |
| `display_name` | Microsoft Entra user display name |
| `mail_nickname` | Microsoft Entra user mail nickname |
| `tenant_id` | Microsoft Entra tenant ID used by the AzureAD provider |

---

## Design Philosophy

- Entra users are principals, not Azure resource scopes
- Entra groups remain in `terraform-az-fk-entra-group`
- Azure RBAC remains in `terraform-az-fk-rbac`
- Service modules should consume user or group IDs instead of creating identities internally
- Examples should compose user lifecycle explicitly where end-to-end labs need it
- Password inputs are marked sensitive, but Terraform state still stores provider-managed password material; protect state accordingly

---

## Related Modules & Training

- [terraform-az-fk-entra-group](https://github.com/foggykitchen/terraform-az-fk-entra-group)
- [terraform-az-fk-rbac](https://github.com/foggykitchen/terraform-az-fk-rbac)
- [terraform-az-fk-managed-identity](https://github.com/foggykitchen/terraform-az-fk-managed-identity)
- [terraform-az-fk-pg](https://github.com/foggykitchen/terraform-az-fk-pg)
- [terraform-az-fk-sql](https://github.com/foggykitchen/terraform-az-fk-sql)

---

## License

Licensed under the Universal Permissive License (UPL), Version 1.0.
See [LICENSE](LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
