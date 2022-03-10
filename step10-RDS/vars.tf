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
variable "sec_group_id" {
  default = "211501a6-8ee2-461e-866c-cfafa1b9965c"
}
variable "vpc-id" {
  default = "7f9ff1db-9bdb-4b6e-a5a0-024683ba48d0" 
}
variable "subnet_id" {
  default = "1d3473f8-2bc5-4af3-ae3b-7a2ccc80fae1"
}
variable "db_password" {
  default = "^bkpWUO3Ha8qEFbvm%mf"
}
 