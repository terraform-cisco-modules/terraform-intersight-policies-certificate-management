#____________________________________________________________________
#
# Collect the moid of the Certificate Management Policy as an Output
#____________________________________________________________________

output "moid" {
  description = "Certificate Management Policy Managed Object ID (moid)."
  value       = intersight_certificatemanagement_policy.certificate.moid
}
