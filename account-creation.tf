# Creating AWS Account

resource "aws_organizations_account" "ci-cd-account" {
    name      = "sen-tf-cicd"
    email     = "senthilatnz.tf.cicd@gmail.com"
    role_name = "MasterAccessRole"
}

resource "aws_iam_user" "sen-tf-cicd-user" {
  
  provider = aws.cicdmember
  name = "sen-tf-cicd-user"
  path = "/"
  force_destroy = true

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "sen-tf-cicd-user-key" {
  provider = aws.cicdmember
  user = aws_iam_user.sen-tf-cicd-user.name
}

resource "aws_iam_user_policy" "sen-tf-cicd-user-policy" {
  provider = aws.cicdmember
  name = "sen-tf-cicd-user-policy"
  user = aws_iam_user.sen-tf-cicd-user.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:iam::573824427850:role/master-role-for-cicd"
    }
  ]
}
EOF
}