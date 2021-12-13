resource "flexibleengine_nat_gateway_v2" "nat_1" {
  name        = "nat_test"
  description = "test for terraform"
  spec        = "1"
  vpc_id      = flexibleengine_vpc_v1.vpc_test.id
  subnet_id   = flexibleengine_vpc_subnet_v1.subnet_1.id
}
