terraform {
  backend "s3" {
    bucket = "bucket-test-francois"
    region = "eu-west-0"
    key = "test-francois/terraform.tfstate"
    endpoint = "oss.eu-west-0.prod-cloud-ocb.orange-business.com"
    access_key = "YourAccessKey"
    secret_key = "YourSecretKey"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}