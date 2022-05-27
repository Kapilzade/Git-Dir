resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"
  policy = jsonencode({
      "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "ec2:*",
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "elasticloadbalancing:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "cloudwatch:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "autoscaling:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "iam:CreateServiceLinkedRole",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:AWSServiceName": [
                        "autoscaling.amazonaws.com",
                        "ec2scheduled.amazonaws.com",
                        "elasticloadbalancing.amazonaws.com",
                        "spot.amazonaws.com",
                        "spotfleet.amazonaws.com",
                        "transitgateway.amazonaws.com"
                    ]
                }
            }
        }
    ]
  })


resource "aws_iam_role" "ec2_role" {
     name =  "ec2_role"
     assume_role_policy = jsonencode({
      version = "2012-10-17"
      statement = [
          {
              Action = "sts:Assumerole"
              Effect =  "Allow"
               Sid   = ""
              Principal = {
                  service = "ec2.amazon.com"
              }
          }
      ]
  })
}


resource "aws_iam_role_policy_attachment" "test-attach" {
     role       = aws_iam_role.ec2_role.name
     policy_arn = aws_iam_policy.policy_arn
}

}