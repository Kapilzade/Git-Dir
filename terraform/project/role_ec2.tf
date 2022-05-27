resource "aws_iam_policy" "ec2_policy" {
    name = "ec2_policy1"
    path = "/"
    description = "policy attach ec2 and provide permission"
    policy = jsoncode
    ("{terraform import aws_iam_policy."administartor arn:aws:iam::aws:policy/AmazonEC2FullAccess"}")
    
}

