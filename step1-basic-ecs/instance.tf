resource "flexibleengine_compute_instance_v2" "basic" {
  name            = "basic"
  image_name      = "OBS CentOS 7.9"
  flavor_id       = "s3.small.1"
  security_groups = ["default"]

  network {
    uuid = var.subnet_id

  }
  tags = vars.tag_Custom
}
