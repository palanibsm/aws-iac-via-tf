# AWS Provider configuration

provider "aws" {
    version = "2.33"
    # shared_credentials_file = var.credentials_file
    # profile = "senthilatnzadmin"
    region = "ap-southeast-2"
}

provider "aws" {
    version = "2.33"
    alias   = "cicdmember"
    region = "ap-southeast-2"

    assume_role {
        role_arn = "arn:aws:iam::032305304595:role/MasterAccessRole"
    }
}