resource "flexibleengine_vpc_v1" "vpc_test" {
  name = "vpc_test_via_terraform-francois"
  cidr = "192.168.0.0/16"
  tags = var.tag_Custom
}

resource "flexibleengine_vpc_subnet_v1" "subnet_1" {
  name       = "subnet_1"
  vpc_id     = flexibleengine_vpc_v1.vpc_test.id
  cidr       = "192.168.0.0/24"
  gateway_ip = "192.168.0.1"
  tags       = var.tag_Custom
}

resource "flexibleengine_vpc_subnet_v1" "subnet_2" {
  name       = "subnet_2"
  vpc_id     = flexibleengine_vpc_v1.vpc_test.id
  cidr       = "192.168.1.0/24"
  gateway_ip = "192.168.1.1"
  tags       = var.tag_Custom
}

resource "flexibleengine_vpc_eip_v1" "eip_elb" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name       = "bandwidth_test_elb"
    size       = 1
    share_type = "PER"
  }

  tags = var.tag_Custom

}