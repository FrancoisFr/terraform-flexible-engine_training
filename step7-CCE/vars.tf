variable "FLEXIBLE_ENGINE_ACCESS_KEY" {}
variable "FLEXIBLE_ENGINE_SECRET_KEY" {}
variable "DOMAIN_NAME" {}
variable "USERNAME" {}
variable "DOMAIN_ID" {}
variable "tag_Custom" {
  default = {
    Owner_Name = "Francois_Richard"
    Project    = "Training"
  }
}
variable "flavor" { default = "s3.xlarge.2" }
variable "cluster_flavor" { default = "cce.s1.small" }
variable "availability_zone" { default = "eu-west-0a" }
variable "ssh_key" { default = "key-as" }
