terraform {
  backend "s3" {
    bucket = "bucket-test-francois"
    region = "eu-west-0"
    key = "test-francois/step-3/terraform.tfstate"
    endpoint = "oss.eu-west-0.prod-cloud-ocb.orange-business.com"
    access_key = "O8HEQDGHG52W0NHEMCOH"
    secret_key = "3aJ39G3zSu1PgUUCMJaTmxgFtpSZ6FrWqkpUFDGg"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}