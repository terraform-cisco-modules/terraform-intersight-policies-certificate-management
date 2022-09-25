module "certificate_management" {
  source  = "scotttyso/policies-certificate-management/intersight"
  version = ">= 1.0.1"

  base64_certificate = 1
  base64_private_key = 1
  description        = "Demo Certificate Management Policy"
  name               = "default"
  organization       = "default"
}
