

# https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-settings.html

#analyzer_name=$(aws accessanalyzer list-analyzers | jq -r .analyzers[].name)
#terraform import -var-file=environments/${env}/env.tfvars module.iam_access_analyzer-${aws_region}.aws_accessanalyzer_analyzer.self[0] ${analyzer_name}

#resource "aws_organizations_organization" "example" {
#  aws_service_access_principals = ["access-analyzer.amazonaws.com"]
#}

resource "aws_accessanalyzer_analyzer" "self" {
  count         = var.enable ? 1 : 0
  analyzer_name = var.analyzer_name
  type          = var.account_type == "master" ? "ORGANIZATION" : "ACCOUNT"
  tags          = var.tags
}
