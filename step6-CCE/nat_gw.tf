resource "flexibleengine_nat_gateway_v2" "nat_public" {
  name        = "nat_test_public"
  description = "test for terraform"
  spec        = "1"
  vpc_id      = flexibleengine_vpc_v1.vpc_test_cce.id
  subnet_id   = flexibleengine_vpc_subnet_v1.subnet_cce.id
}


resource "flexibleengine_nat_snat_rule_v2" "snat_public" {
  nat_gateway_id = flexibleengine_nat_gateway_v2.nat_public.id
  floating_ip_id = flexibleengine_vpc_eip_v1.eip_SNAT.id
  subnet_id      = flexibleengine_vpc_subnet_v1.subnet_cce.id
}

resource "flexibleengine_nat_dnat_rule_v2" "dnat_public" {
  nat_gateway_id        = flexibleengine_nat_gateway_v2.nat_public.id
  floating_ip_id        = flexibleengine_vpc_eip_v1.eip_DNAT.id
  port_id               = "60e0edbc-452a-428d-94e9-c031b660a7ff"
  protocol              = "tcp"
  internal_service_port = 22
  external_service_port = 8080
}
