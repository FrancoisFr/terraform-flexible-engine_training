resource "flexibleengine_compute_instance_v2" "instance" {
  name            = "instance-AS_base"
  image_name      = "OBS CentOS 7.9"
  flavor_id       = var.flavor
  security_groups = ["default"]
  key_pair        = "key-as"

  network {
    uuid = flexibleengine_vpc_subnet_v1.subnet_public.id

  }

  tags = var.tag_Custom

}
