resource "flexibleengine_lb_loadbalancer_v2" "lb_1" {
  vip_subnet_id = flexibleengine_vpc_subnet_v1.subnet_2.vpc_id
  name          = "elb_test"
  region        = "eu-west-0"

  tags = {
    key = "value"
  }
}