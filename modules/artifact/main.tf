
#https://docs.aws.amazon.com/organizations/latest/userguide/services-that-can-integrate-artifact.html
#aws organizations enable-aws-service-access \
#    --service-principal aws-artifact-account-sync.amazonaws.com

#{
#    "Version": "2012-10-17",
#    "Statement": [
#        {
#            "Effect": "Allow",
#            "Action": [
#                "artifact:Get"
#            ],
#            "Resource": [
#                "arn:aws:artifact:::report-package/*"
#            ]
#        }
#    ]
#}
#{
#    "Version": "2012-10-17",
#    "Statement": [
#        {
#            "Effect": "Allow",
#            "Action": [
#                "artifact:AcceptAgreement",
#                "artifact:DownloadAgreement",
#                "artifact:TerminateAgreement"
#            ],
#            "Resource": [
#              "arn:aws:artifact::*:customer-agreement/*",
#              "arn:aws:artifact:::agreement/*"
#            ]
#        }
#    ]
#}
#
#{
#    "Version": "2012-10-17",
#    "Statement": [
#        {
#            "Effect": "Allow",
#            "Principal": {
#                "Service": "aws-artifact-account-sync.amazonaws.com"
#            },
#            "Action": "sts:AssumeRole",
#            "Condition": {
#                "ArnEquals": {
#                  "aws:SourceArn": "arn:aws:artifact:us-west-2:00117294401"
#                },
#                "StringEquals": {
#                  "aws:SourceAccount": "00117294401"
#                }
#            }
#        }
#    ]
#}
