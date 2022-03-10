
#Création d'EIP


resource "flexibleengine_vpc_eip_v1" "eip_DNAT-master" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name       = "bandwidth_test_IN"
    size       = 10
    share_type = "PER"
  }

  tags = var.tag_Custom

}

resource "flexibleengine_vpc_eip_v1" "eip_DNAT-slave" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name       = "bandwidth_test_IN"
    size       = 10
    share_type = "PER"
  }

  tags = var.tag_Custom

}


resource "flexibleengine_nat_dnat_rule_v2" "dnat_master" {
  nat_gateway_id        = var.nat_gw_id
  floating_ip_id        = flexibleengine_vpc_eip_v1.eip_DNAT-master.id
  port_id               = flexibleengine_compute_instance_v2.node-master.network[0].port
  protocol              = "tcp"
  internal_service_port = 22
  external_service_port = 8585
}

resource "flexibleengine_nat_dnat_rule_v2" "dnat_slave" {
  nat_gateway_id        = var.nat_gw_id
  floating_ip_id        = flexibleengine_vpc_eip_v1.eip_DNAT-slave.id
  port_id               = flexibleengine_compute_instance_v2.node-slave.network[0].port
  protocol              = "tcp"
  internal_service_port = 22
  external_service_port = 8585
}
