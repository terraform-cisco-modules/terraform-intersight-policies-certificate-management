#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > {Name}
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  for_each = {
    for v in [var.organization] : v => v if length(
      regexall("[[:xdigit:]]{24}", var.organization)
    ) == 0
  }
  name = each.value
}

#____________________________________________________________
#
# Intersight UCS Server Profile(s) Data Source
# GUI Location: Profiles > UCS Server Profiles > {Name}
#____________________________________________________________

data "intersight_server_profile" "profiles" {
  for_each = { for v in var.profiles : v.name => v if v.object_type == "server.Profile" }
  name     = each.value.name
}

#__________________________________________________________________
#
# Intersight UCS Server Profile Template(s) Data Source
# GUI Location: Templates > UCS Server Profile Templates > {Name}
#__________________________________________________________________

data "intersight_server_profile_template" "templates" {
  for_each = { for v in var.profiles : v.name => v if v.object_type == "server.ProfileTemplate" }
  name     = each.value.name
}

#__________________________________________________________________
#
# Intersight Certificate Management Policy
# GUI Location: Policies > Create Policy > Certificate Management
#__________________________________________________________________

resource "intersight_certificatemanagement_policy" "certificate_management" {
  depends_on = [
    data.intersight_server_profile.profiles,
    data.intersight_server_profile_template.templates,
    data.intersight_organization_organization.org_moid
  ]
  description = var.description != "" ? var.description : "${var.name} Certificate Management Policy."
  name        = var.name
  organization {
    moid = length(
      regexall("[[:xdigit:]]{24}", var.organization)
      ) > 0 ? var.organization : data.intersight_organization_organization.org_moid[
      var.organization].results[0
    ].moid
    object_type = "organization.Organization"
  }
  certificates {
    certificate {
      pem_certificate = length(
        regexall("1", var.base64_certificate)
        ) > 0 ? var.base64_certificate_1 : length(
        regexall("2", var.base64_certificate)
        ) > 0 ? var.base64_certificate_2 : length(
        regexall("3", var.base64_certificate)
        ) > 0 ? var.base64_certificate_3 : length(
        regexall("4", var.base64_certificate)
        ) > 0 ? var.base64_certificate_4 : length(
        regexall("5", var.base64_certificate)
      ) > 0 ? var.base64_certificate_5 : null
    }
    enabled = var.enabled
    privatekey = length(
      regexall("1", var.base64_private_key)
      ) > 0 ? var.base64_private_key_1 : length(
      regexall("2", var.base64_private_key)
      ) > 0 ? var.base64_private_key_2 : length(
      regexall("3", var.base64_private_key)
      ) > 0 ? var.base64_private_key_3 : length(
      regexall("4", var.base64_private_key)
      ) > 0 ? var.base64_private_key_4 : length(
      regexall("5", var.base64_private_key)
    ) > 0 ? var.base64_private_key_5 : null
  }
  dynamic "profiles" {
    for_each = { for v in var.profiles : v.name => v }
    content {
      moid = length(regexall("server.ProfileTemplate", profiles.value.object_type)
        ) > 0 ? data.intersight_server_profile_template.templates[profiles.value.name].results[0
      ].moid : data.intersight_server_profile.profiles[profiles.value.name].results[0].moid
      object_type = profiles.value.object_type
    }
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
