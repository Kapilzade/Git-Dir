provider "aws" {
  access_key = AKIAT464LUR5IKVUEAPR
  secret_key = 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
  region = us-east-2
}

resource "aws_iam_user" "terraform" {
name = "awsuser" 
path = "/"
force_destroy = true
}

resource "aws_iam_user_login_profile" "awsuser_profile" {
    user = aws_iam_user.terraform
    pgp_key = "keybase:kapilzade"
  
}
 
output "password" {
  value = aws_iam_user_login_profile.awsuser_profile.encrypted_password
}