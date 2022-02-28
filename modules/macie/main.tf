
# --------------------------------------------------------------------------------------------------
# Enable Macie2
# --------------------------------------------------------------------------------------------------

resource "aws_macie2_account" "self" {
  count                        = var.enable ? 1 : 0
  status                       = "ENABLED"
  finding_publishing_frequency = var.finding_publishing_frequency
}

resource "aws_macie2_organization_admin_account" "self" {
  admin_account_id = "ID OF THE ADMIN ACCOUNT"
  depends_on       = [aws_macie2_account.self]
}

resource "aws_macie2_member" "members" {
  count                                 = var.enable ? length(var.member_accounts) : 0
  status                                = "ENABLED"
  invite                                = true
  account_id                            = var.member_accounts[count.index].account_id
  invitation_disable_email_notification = var.disable_email_notification
  email                                 = var.member_accounts[count.index].email
  invitation_message                    = var.invitation_message
}

resource "aws_macie2_invitation_accepter" "master" {
  count                    = var.enable && var.master_account_id != "" ? 1 : 0
  administrator_account_id = var.master_account_id
}
