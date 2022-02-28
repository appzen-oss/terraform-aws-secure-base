#!/usr/bin/env bash

# https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-partner-providers.html
# List of all products
#   aws securityhub describe-products
# List of products subscribed to
#   aws securityhub list-enabled-products-for-import

cat <<VARHEADER
variable "product_arns" {
  description = "Security Hub product integrations"
  type = map
  default = {
VARHEADER

(for arn in $(aws securityhub describe-products | jq -r .Products[].ProductArn | cut -d: -f5- ); do
  product=${arn##*/}
  echo "    \"${product}\" = \"${arn}\""
done) | sort

cat <<VARFOOTER
  }
}
VARFOOTER
