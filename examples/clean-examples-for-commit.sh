#!/usr/bin/env bash

# Clean AWS profile names and account IDs
# Make examples safe for commit to git

for f in $(ls -1 */*.tfvars); do
  sed -ri '' '/aws_profile/s/\"(.*)\"/\"#AWS profile#\"/;/security_administrator_account_id/s/[0-9]+/123456789012/' ${f}
done
for f in $(ls -1 */providers.tf); do
  sed -ri '' '/profile/s/\"(.*)\"/\"#AWS profile#\"/' ${f}
done
