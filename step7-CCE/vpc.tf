resource "flexibleengine_vpc_v1" "vpc_test_cce" {
  name = "vpc_test_cce"
  cidr = "192.168.0.0/16"
}

resource "flexibleengine_vpc_subnet_v1" "subnet_cce" {
  name       = "subnet_cce"
  vpc_id     = flexibleengine_vpc_v1.vpc_test_cce.id
  cidr       = "192.168.0.0/24"
  gateway_ip = "192.168.0.1"
}

resource "flexibleengine_vpc_eip_v1" "eip_node1" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name       = "bandwidth_test_node1"
    size       = 1
    share_type = "PER"
  }

  tags = var.tag_Custom

}

resource "flexibleengine_vpc_eip_v1" "eip_node2" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name       = "bandwidth_test_node2"
    size       = 1
    share_type = "PER"
  }

  tags = var.tag_Custom

}
