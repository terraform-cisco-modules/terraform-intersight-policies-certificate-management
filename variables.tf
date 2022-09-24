#____________________________________________________________
#
# Certificate Management Policy Variables Section.
#____________________________________________________________

variable "base64_certificate" {
  default     = ""
  description = "The Number of the base64_certificate Variable.  i.e. 1 = base64_certificate_1."
  sensitive   = true
  type        = string
}

variable "base64_certificate_1" {
  default     = ""
  description = "The Server Certificate in Base64 format."
  sensitive   = true
  type        = string
}

variable "base64_certificate_2" {
  default     = ""
  description = "The Server Certificate in Base64 format."
  sensitive   = true
  type        = string
}

variable "base64_certificate_3" {
  default     = ""
  description = "The Server Certificate in Base64 format."
  sensitive   = true
  type        = string
}

variable "base64_certificate_4" {
  default     = ""
  description = "The Server Certificate in Base64 format."
  sensitive   = true
  type        = string
}

variable "base64_certificate_5" {
  default     = ""
  description = "The Server Certificate in Base64 format."
  sensitive   = true
  type        = string
}

variable "base64_private_key" {
  default     = ""
  description = "The Number of the base64_private_key Variable.  i.e. 1 = base64_private_key_1."
  sensitive   = true
  type        = string
}

variable "base64_private_key_1" {
  default     = ""
  description = "Private Key in Base64 Format."
  sensitive   = true
  type        = string
}

variable "base64_private_key_2" {
  default     = ""
  description = "Private Key in Base64 Format."
  sensitive   = true
  type        = string
}

variable "base64_private_key_3" {
  default     = ""
  description = "Private Key in Base64 Format."
  sensitive   = true
  type        = string
}

variable "base64_private_key_4" {
  default     = ""
  description = "Private Key in Base64 Format."
  sensitive   = true
  type        = string
}

variable "base64_private_key_5" {
  default     = ""
  description = "Private Key in Base64 Format."
  sensitive   = true
  type        = string
}

variable "description" {
  default     = ""
  description = "Description for the Policy."
  type        = string
}

variable "enabled" {
  default     = true
  description = "Enable/Disable the Certificate Management policy."
  type        = bool
}

variable "name" {
  default     = "default"
  description = "Name for the Policy."
  type        = string
}

variable "organization" {
  default     = "default"
  description = "Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/."
  type        = string
}

variable "profiles" {
  default     = []
  description = <<-EOT
  List of Profiles to Assign to the Policy.
    * name - Name of the Profile to Assign.
    * object_type - Object Type to Assign in the Profile Configuration.
      - server.Profile - For UCS Server Profiles.
      - server.ProfileTemplate - For UCS Server Profile Templates.
  EOT
  type = list(object(
    {
      moid        = string
      object_type = optional(string, "server.Profile")
    }
  ))
}

variable "tags" {
  default     = []
  description = "List of Tag Attributes to Assign to the Policy."
  type        = list(map(string))
}
