# main

locals {
  region_enabled        = data.aws_regions.enabled.names
  region_filter         = setsubtract(local.region_enabled, var.region_exclude)
  region_list           = length(var.region_list) == 0 ? local.region_filter : var.region_list
}

