resource "flexibleengine_lb_loadbalancer_v2" "lb_1" {
  vip_subnet_id = flexibleengine_vpc_eip_v1.eip_elb.id
  name          = "elb_test"
  region        = "eu-west-0"

  tags = {
    key = "value"
  }
}

resource "flexibleengine_lb_listener_v2" "listener_1" {
  protocol        = "HTTP"
  protocol_port   = 8080
  loadbalancer_id = flexibleengine_lb_loadbalancer_v2.lb_1.id

  tags = var.tag_Custom
}

resource "flexibleengine_lb_pool_v2" "pool_1" {
  protocol    = "HTTP"
  lb_method   = "ROUND_ROBIN"
  listener_id = flexibleengine_lb_listener_v2.listener_1.id

  persistence {
    type        = "HTTP_COOKIE"
    cookie_name = "testCookie"
  }
}

resource "flexibleengine_lb_member_v2" "member_1" {
  address       = "192.168.199.23"
  protocol_port = 8080
  pool_id       = flexibleengine_lb_pool_v2.pool_1.id
  subnet_id     = flexibleengine_vpc_subnet_v1.subnet_1.id
}