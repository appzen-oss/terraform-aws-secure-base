#!/usr/bin/env bash

# https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-partner-providers.html
# List of all products
#   aws securityhub describe-products
# List of products subscribed to
#   aws securityhub list-enabled-products-for-import

cat <<VARHEADER

# To build current version of this
# scripts/build-var-products.sh > file

variable "product_arns" {
  description = "Security Hub product integrations"
  type        = map(any)
  default = {
VARHEADER

product_arns=$(aws securityhub describe-products | jq -r .Products[].ProductArn | cut -d: -f5- )
max_len=0
for arn in ${product_arns}; do
  product=$(echo ${arn} | rev | cut -d/ -f-2 | rev)
  [ ${#product} -gt ${max_len} ] && max_len=${#product}
done
(for arn in ${product_arns}; do
  product=$(echo ${arn} | rev | cut -d/ -f-2 | rev)
  spacing=$(( max_len - ${#product} + 1 ))
  printf "    \"%s\" %${spacing}s \"%s\"\n" ${product} '=' ${arn}
done) | sort

cat <<VARFOOTER
  }
}
VARFOOTER
