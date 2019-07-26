resource "aws_iam_policy" "MFAAccessIfMFADisabled"{
  name        = "MFAAccess"
  description = "My test policy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "iam:EnableMFADevice",
        "iam:CreateVirtualMFADevice",
        "iam:ListVirtualMFADevices",
        "iam:ListMFADevices"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Condition": {
            "BoolIfExists": {
                "aws:MultiFactorAuthPresent": "false"
               }
           }
    }
  ]
}
EOF
}

resource "aws_iam_policy" "EngineerAccessIfMFAEnabled"{
  name   = "EngineerAccess"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": ["ec2:*","s3:*"],
      "Effect": "Allow",
      "Resource": "*",
       "Condition": {
            "BoolIfExists": {
                "aws:MultiFactorAuthPresent": "true"
               }
           }
    }
  ]
}
EOF
}

resource "aws_iam_policy" "AdminAccessIfMFAEnabled"{
  name  = "AdminAccess"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Effect": "Allow",
      "Resource": "*",
       "Condition": {
            "BoolIfExists": {
                "aws:MultiFactorAuthPresent": "true"
               }
           }
    }
  ]
}
EOF
}
