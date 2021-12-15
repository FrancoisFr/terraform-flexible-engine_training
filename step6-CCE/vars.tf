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
variable "flavor" { default = "s3.large.2" }
variable availability_zone { default = "AZ1"  }
variable ssh_key {  default = "key-as" }
