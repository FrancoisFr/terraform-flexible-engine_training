resource "flexibleengine_compute_instance_v2" "basic" {
  name            = "basic"
  image_name      = "OBS CentOS 7.9"
  flavor_id       = "s3.small.1"
  security_groups = ["default"]

  network {
    uuid = flexibleengine_vpc_subnet_v1.subnet_1.id

  }
  
  tags = var.tag_Custom
}
