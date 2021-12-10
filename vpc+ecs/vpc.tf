resource "flexibleengine_vpc_v1" "vpc_test" {
  name = "vpc_test_via_terraform-francois"
  cidr = "192.168.0.0/16"
}

resource "flexibleengine_networking_subnet_v2" "subnet_1" {
  name       = "subnet_1"
  network_id = flexibleengine_vpc_v1.vpc_test.id
  cidr       = "192.168.199.0/24"
  ip_version = 4
}
