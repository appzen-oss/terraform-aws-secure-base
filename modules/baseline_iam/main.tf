locals {
}

# --------------------------------------------------------------------------------------------------
# Password Policy
# --------------------------------------------------------------------------------------------------

resource "aws_iam_account_password_policy" "default" {
  #checkov:skip=CKV_AWS_9:No password expiration for now
  #ts:skip=AC_AWS_0138 No password expiration for now
  #ts:skip=AC_AWS_0472 Password reuse ok for now
  count                          = var.enable && var.create_password_policy ? 1 : 0
  minimum_password_length        = var.minimum_password_length
  password_reuse_prevention      = var.password_reuse_prevention
  require_lowercase_characters   = var.require_lowercase_characters
  require_numbers                = var.require_numbers
  require_uppercase_characters   = var.require_uppercase_characters
  require_symbols                = var.require_symbols
  allow_users_to_change_password = var.allow_users_to_change_password
  max_password_age               = var.max_password_age
}

# --------------------------------------------------------------------------------------------------
# Support Role - https://us-east-1.console.aws.amazon.com/securityhub/home?region=us-east-1#/standards/cis-aws-foundations-benchmark-1.4.0/1.17
#                https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-cis-controls.html#cis-1.20-remediation
# --------------------------------------------------------------------------------------------------
#data "aws_iam_policy_document" "support_assume_policy" {
#  statement {
#    principals {
#      type        = "AWS"
#      identifiers = var.support_iam_role_principal_arns
#    }
#    actions = ["sts:AssumeRole"]
#  }
#}

resource "aws_iam_role" "support" {
  count              = var.enable && var.create_support_role ? 1 : 0
  name               = var.support_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.support_assume_policy.json
  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "support_policy" {
  count      = var.enable && var.create_support_role ? 1 : 0
  role       = aws_iam_role.support[0].id
  policy_arn = "arn:aws:iam::aws:policy/AWSSupportAccess"
}
