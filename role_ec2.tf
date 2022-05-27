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
          },
      ]
  })
}