resource "flexibleengine_compute_instance_v2" "instance1-step4" {
  name            = "instance1-step4"
  image_name      = "OBS CentOS 7.9"
  flavor_id       = "s3.small.1"
  security_groups = ["default"]

  network {
    uuid = flexibleengine_vpc_subnet_v1.subnet_public.id

  }

  tags = var.tag_Custom

}

resource "flexibleengine_compute_instance_v2" "instance2-step4" {
  name            = "instance2-step4"
  image_name      = "OBS CentOS 7.9"
  flavor_id       = "s3.small.1"
  security_groups = ["default"]

  network {
    uuid = flexibleengine_vpc_subnet_v1.subnet_private.id

  }

  tags = var.tag_Custom

}
