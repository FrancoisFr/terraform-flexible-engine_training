terraform {
  backend "s3" {
    bucket     = "bucket-test-francois"
    region     = "eu-west-0"
    key        = "test-francois/step-7/terraform.tfstate"
    endpoint   = "oss.eu-west-0.prod-cloud-ocb.orange-business.com"
    access_key = "<YOUR ACCESS KEY>"
    secret_key = "<YOUR SECRET KEY>"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}
