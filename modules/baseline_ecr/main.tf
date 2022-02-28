
# ECR scanning configuration
# https://docs.aws.amazon.com/AmazonECR/latest/APIReference/API_ScanningRepositoryFilter.html

# Regional
resource "aws_ecr_registry_scanning_configuration" "self" {
  count     = var.enable ? 1 : 0
  scan_type = var.scan_type
  dynamic "rule" {
    for_each = var.rules
    content {
      scan_frequency = rule.value["frequency"]
      repository_filter {
        filter      = rule.value["filter"]
        filter_type = "WILDCARD"
      }
    }
  }
}
