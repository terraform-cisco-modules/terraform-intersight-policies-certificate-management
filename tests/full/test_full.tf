module "main" {
  source               = "../.."
  base64_certificate   = 1
  base64_certificate_1 = var.base64_certificate_1
  base64_private_key   = 1
  base64_private_key_1 = var.base64_private_key_1
  description          = "${var.name} Certificate Management Policy."
  name                 = var.name
  organization         = "terratest"
}

variable "base64_certificate_1" {
  sensitive = true
  type      = string
}

variable "base64_private_key_1" {
  sensitive = true
  type      = string
}

