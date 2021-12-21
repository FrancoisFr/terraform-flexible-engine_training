resource "flexibleengine_nat_gateway_v2" "nat_public" {
  name        = "nat_test_public"
  description = "test for terraform"
  spec        = "1"
  vpc_id      = flexibleengine_vpc_v1.vpc_test_cce.id
  subnet_id   = flexibleengine_vpc_subnet_v1.subnet_cce.id
}


resource "flexibleengine_nat_snat_rule_v2" "snat_public" {
  nat_gateway_id = flexibleengine_nat_gateway_v2.nat_public.id
  floating_ip_id = flexibleengine_vpc_eip_v1.eip_node1.id
  subnet_id      = flexibleengine_vpc_subnet_v1.subnet_cce.id
}

