resource "flexibleengine_compute_instance_v2" "instance1-step3" {
  name            = "instance1-step3"
  image_name      = "OBS CentOS 7.9"
  flavor_id       = "s3.small.1"
  security_groups = ["default"]

  network {
    uuid = flexibleengine_vpc_subnet_v1.subnet_1.id

  }

  tags = {
    Owner_Name = var.tag_OwnerName
    Project = "Training"
  }
}

resource "flexibleengine_compute_instance_v2" "instance2-step3" {
  name            = "instance2-step3"
  image_name      = "OBS CentOS 7.9"
  flavor_id       = "s3.small.1"
  security_groups = ["default"]

  network {
    uuid = flexibleengine_vpc_subnet_v1.subnet_2.id

  }

  tags = {
    Owner_Name = var.tag_OwnerName
    Project = "Training"
  }

}
