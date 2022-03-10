variable "FLEXIBLE_ENGINE_ACCESS_KEY" {}
variable "FLEXIBLE_ENGINE_SECRET_KEY" {}
variable "DOMAIN_NAME" {}
variable "USERNAME" {}
variable "DOMAIN_ID" {}
variable "key_pair" {
  default = "KeyPair-test_linux"
}
variable "network_id" {
  default = "7f9ff1db-9bcdb-4b6e-a5a0-024683ba48d0"
}
variable "subnet_id" {
  default = "1d3473f8-2bc5-4af3-ae3b-7a2ccc80fae1"
}
variable "security_group_id" {
  default = "40ff52d9-a9f3-4ca1-863e-644220d59af3"
}
variable "tag_Custom" {
  default = {
    Owner_Name = "Francois_Richard"
    Project    = "Training"
  }
}
variable "image_name" {
  default = "OBS Ubuntu 20.04"
}
variable "flavor_id" {
  default = "s3.xlarge.2"
}
variable "nat_gw_id" {
  default = "6e51a628-0fb9-43df-9081-02b34181d12f"
}