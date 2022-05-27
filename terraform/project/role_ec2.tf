resource "aws_iam_policy" "policy" {
    name = "ec2_policy1"
    path = "/"
    description = "policy attach ec2 and provide permission"
    policy = jsonencode ({
        version = "2012-10-17"
        statement = [
            {
            Action = [
          "ec2:All EC2 actions",
        ]
        Effect   = "Allow"
        Resource = "*"
            }
        ]
    })
}