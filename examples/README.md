# Microsoft Entra Users with Terraform/OpenTofu - Training Examples

This directory contains minimal free examples used with the **terraform-az-fk-entra-user** module.
The examples are designed as incremental building blocks for Microsoft Entra identity compositions on Azure.

These examples are part of the [FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/) and are meant to be applied independently for learning and experimentation.

---

## Example Overview

| Example | Title | Key Topics |
|:-------:|:------|:-----------|
| 01 | **Single User** | Microsoft Entra user, user principal name, display name, mail nickname, initial password handling |
| 02 | **Multiple Users** | Multiple Microsoft Entra users, repeatable user map, object ID outputs, group membership preparation |

---

## How to Use

Each example directory contains:

- Terraform/OpenTofu configuration (`.tf`)
- A focused `README.md` explaining the goal of the example
- A `terraform.tfvars.example` file with placeholder values

To run an example:

```bash
cd examples/01_single_user
cp terraform.tfvars.example terraform.tfvars
tofu init
tofu plan
tofu apply
```

The current free learning path contains two minimal examples:

```text
01
02
```

Larger identity governance compositions belong in FoggyKitchen landing zones or blueprints, not in free module examples.

---

## Design Principles

- One example = one identity goal
- Entra users are modeled as tenant-level directory objects, not Azure resource group resources
- Entra groups, Azure RBAC, and application access are composed with dedicated FoggyKitchen modules
- Examples avoid hidden dependencies between directories
- Password inputs are marked sensitive, but Terraform/OpenTofu state must still be protected
- Larger identity governance compositions belong in landing zones or blueprints, not in free module examples

---

## Blueprint Candidates

Advanced Microsoft Entra user scenarios should be modeled as FoggyKitchen landing zones or blueprints:

- User and group composition for application access
- Azure RBAC assignments driven by Microsoft Entra users or groups
- Privileged access patterns using dedicated administrative identities
- Identity onboarding flows with groups, RBAC, and application role assignments
- Lab tenants with repeatable user sets for platform training
- Integration patterns for modules that consume user object IDs

---

## Related Resources

- [FoggyKitchen Microsoft Entra User Module](../)
- [FoggyKitchen Microsoft Entra Group Module](https://github.com/foggykitchen/terraform-az-fk-entra-group)
- [FoggyKitchen Azure RBAC Module](https://github.com/foggykitchen/terraform-az-fk-rbac)
- [FoggyKitchen Azure Managed Identity Module](https://github.com/foggykitchen/terraform-az-fk-managed-identity)
- [FoggyKitchen Azure PostgreSQL Module](https://github.com/foggykitchen/terraform-az-fk-pg)
- [FoggyKitchen Azure SQL Module](https://github.com/foggykitchen/terraform-az-fk-sql)

---

## License

Licensed under the Universal Permissive License (UPL), Version 1.0.
See [LICENSE](../LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
