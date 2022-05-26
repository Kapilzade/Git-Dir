resource "aws_iam_user" "terraform" {
name = "awsuser" 
path = "/"
force_destroy = true
}

resource "aws_iam_user_login_profile" "awsuser_profile" {
 user  = aws_iam_user.terraform.name
 pgp_key  = "keybase:kapilzade"
  
}
 
output "password" {
  value = aws_iam_user_login_profile.awsuser_profile.encrypted_password
}