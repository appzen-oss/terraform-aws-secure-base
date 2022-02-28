
data "aws_organizations_organization" "self" {}

locals {
  # macie, backup, dir service,
  # license manager,
  # serv cat, X SSO, system manager
  # ADD:
  #   health.amazonaws.com
  #   reporting.trustedadvisor.amazonaws.com
  #   servicequotas.amazonaws.com
  #   var.enable_compute_optimzer ? "compute-optimizer.amazonaws.com" : "",
  #   var.enable_ram ? "ram.amazonaws.com" : "",
  #   var.enable_s3_storage_lens ? "storage-lens.s3.amazonaws.com" : "",
  #   var.enable_tag_policies ? "tagpolicies.tag.amazonaws.com" : ""
  # aws organizations list-aws-service-access-for-organization
  # aws organizations list-delegated-administrators
  # aws organizations list-delegated-services-for-account --account-id XX
  # aws organizations list-policies --filter XX

  # Set of principals to disable
  remove_access_principals = toset(compact(
    [
      !var.enable_cloudtrail ? "cloudtrail.amazonaws.com" : "",
      !var.enable_config ? "config.amazonaws.com" : "",
      !var.enable_config ? "config-multiaccountsetup.amazonaws.com" : "",
      !var.enable_firewall_manager ? "fms.amazonaws.com" : "",
      !var.enable_guardduty ? "guardduty.amazonaws.com" : "",
      !var.enable_iam_access_analyzer ? "access-analyzer.amazonaws.com" : "",
      !var.enable_securityhub ? "securityhub.amazonaws.com" : "",
    ]
  ))
  # This is NOT designed to disable existing principals. It can ONLY ADD.
  access_principals = toset(compact(concat(
    tolist(data.aws_organizations_organization.self.aws_service_access_principals),
    [
      var.enable_cloudtrail ? "cloudtrail.amazonaws.com" : "",
      var.enable_config ? "config.amazonaws.com" : "",
      var.enable_config ? "config-multiaccountsetup.amazonaws.com" : "",
      var.enable_firewall_manager ? "fms.amazonaws.com" : "",
      var.enable_firewall_manager ? "ram.amazonaws.com" : "",
      var.enable_guardduty ? "guardduty.amazonaws.com" : "",
      var.enable_iam_access_analyzer ? "access-analyzer.amazonaws.com" : "",
      var.enable_securityhub ? "securityhub.amazonaws.com" : "",
    ]
  )))
  # Final principals set with items added and removed
  aws_service_access_principals = setsubtract(
  local.access_principals, local.remove_access_principals)
  #var.enable_artifact         ? "" : "",

  #enabled_policy_types = toset(compact([
  #  var.enable_org_policy_aiservices ? "AISERVICES_OPT_OUT_POLICY" : "",
  #  var.enable_org_policy_backup ? "BACKUP_POLICY" : "",
  #  var.enable_org_policy_scp ? "SERVICE_CONTROL_POLICY" : "",
  #  var.enable_tag_policies ? "TAG_POLICY" : ""
  #]))
}

resource "aws_organizations_organization" "self" {
  count                         = var.account_type == "master" ? 1 : 0
  aws_service_access_principals = local.aws_service_access_principals
  enabled_policy_types          = data.aws_organizations_organization.self.enabled_policy_types
  feature_set                   = "ALL"
}
