resource "flexibleengine_nat_gateway_v2" "nat_public" {
  name        = "nat_test_public"
  description = "test for terraform"
  spec        = "1"
  vpc_id      = flexibleengine_vpc_v1.vpc_test_cce.id
  subnet_id   = flexibleengine_vpc_subnet_v1.subnet_cce.id
}
