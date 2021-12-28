resource "flexibleengine_compute_instance_v2" "basic" {
  name            = "machine-francois"
  image_name      = var.image_name
  flavor_id       = var.flavor_id
  security_groups = ["default"]
  key_pair        = var.key_pair
  network {
    uuid = var.subnet_id

  }
  tags = var.tag_Custom
}
