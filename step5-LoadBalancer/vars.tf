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
variable "subnet_id" {
  default = "1d3473f8-2bc5-4af3-ae3b-7a2ccc80fae1"
}
