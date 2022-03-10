# création d'un bucket via terraform

resource "flexibleengine_obs_bucket" "bucket_terraform_francois" {
  bucket     = "my-tf-test-bucket"
  acl        = "private"
  versioning = true
}