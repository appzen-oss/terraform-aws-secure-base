data "aws_caller_identity" "current" {}

data  "aws_iam_policy_document" "support_assume_policy" {
  statement {
    sid     = "supportpolicy"
    actions     = ["sts:AssumeRole"]
    principals  {
      type    = "AWS"
      identifiers = [data.aws_caller_identity.current.id]
    }
  }
}
