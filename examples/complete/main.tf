module "certificate" {
  source  = "scotttyso/policies-certificate-management/intersight"
  version = ">= 1.0.1"

  base64_certificate = var.base64_certificate
  base64_private_key = var.base64_private_key
  description        = "Demo Certificate Management Policy"
  name               = "default"
  organization       = "default"
}
