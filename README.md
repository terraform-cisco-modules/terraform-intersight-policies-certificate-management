<!-- BEGIN_TF_DOCS -->
# Terraform Intersight Policies - Certificate Management
Manages Intersight Certificate Management Policies

Location in GUI:
`Policies` » `Create Policy` » `Certificate Management`

## Example

### main.tf
```hcl
module "certificate" {
  source  = "scotttyso/policies-certificate-management/intersight"
  version = ">= 1.0.1"

  base64_certificate = var.base64_certificate
  base64_private_key = var.base64_private_key
  description        = "Demo Certificate Management Policy"
  name               = "default"
  organization       = "default"
}
```

### variables.tf
```hcl
variable "base64_certificate" {
  description = "The Server Certificate in Base64 format."
  sensitive   = true
  type        = string
}

variable "base64_private_key" {
  description = "Private Key in Base64 Format."
  sensitive   = true
  type        = string
}

variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}
```

### versions.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
}

provider "intersight" {
  apikey    = var.apikey
  endpoint  = var.endpoint
  secretkey = var.secretkey
}
```

## Environment Variables

## Terraform Cloud/Enterprise - Workspace Variables
- Add variable apikey with value of [your-api-key]
- Add variable base64_certificate with value of [your-base64_certificate]
- Add variable base64_private_key with value of [your-base64_private_key]
- Add variable secretkey with value of [your-secret-file-content]

## Linux
```bash
export TF_VAR_apikey="<your-api-key>"
export TF_VAR_base64_certificate=`cat <your-base64_certificate>`
export TF_VAR_base64_private_key=`cat <your-base64_private_key>`
export TF_VAR_secretkey=`cat <secret-key-file-location>`
```

## Windows
```bash
$env:TF_VAR_apikey="<your-api-key>"
$env:TF_VAR_base64_certificate="<your-base64_certificate>"
$env:TF_VAR_base64_private_key="<your-base64_private_key>"
$env:TF_VAR_secretkey="<secret-key-file-location>"
```


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.32 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.32 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_base64_certificate"></a> [base64\_certificate](#input\_base64\_certificate) | The Server Certificate in Base64 format. | `string` | n/a | yes |
| <a name="input_base64_private_key"></a> [base64\_private\_key](#input\_base64\_private\_key) | Private Key in Base64 Format. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description for the Policy. | `string` | `""` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Enable/Disable the Certificate Management policy. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the Policy. | `string` | `"default"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/. | `string` | `"default"` | no |
| <a name="input_profiles"></a> [profiles](#input\_profiles) | List of Profiles to Assign to the Policy.<br>  * name - Name of the Profile to Assign.<br>  * object\_type - Object Type to Assign in the Profile Configuration.<br>    - server.Profile - For UCS Server Profiles.<br>    - server.ProfileTemplate - For UCS Server Profile Templates. | <pre>list(object(<br>    {<br>      moid        = string<br>      object_type = optional(string)<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tag Attributes to Assign to the Policy. | `list(map(string))` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | Certificate Management Policy Managed Object ID (moid). |
## Resources

| Name | Type |
|------|------|
| [intersight_certificatemanagement_policy.certificate_management](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/certificatemanagement_policy) | resource |
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |
<!-- END_TF_DOCS -->