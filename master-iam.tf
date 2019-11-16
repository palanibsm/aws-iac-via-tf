# Creates IAM role to allow CI-CD account to assume, in order to create AWS Accounts

resource "aws_iam_role" "master-role-for-cicd" {
    name = "master-role-for-cicd"
    description = "Master Admin Role for CICD Account to assume role"

    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowCICDToAssumeToMaster",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::032305304595:root"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_policy" "master-policy-for-cicd" {
    name = "master-policy-for-cicd"
    description = "Policy to attach to master-role-for-cicd"

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AdminAccessForCICDRole",
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
} 
EOF
}

resource "aws_iam_role_policy_attachment" "master-policy-cicd-attachment" {
    role       = aws_iam_role.master-role-for-cicd.name
    policy_arn = aws_iam_policy.master-policy-for-cicd.arn
}