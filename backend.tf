terraform {
    backend "s3" {
        bucket = "sen-nz-au-fndn"
        key    = "tf-state/org/terraform.tfstate"
        region = "ap-southeast-2"
    }
}