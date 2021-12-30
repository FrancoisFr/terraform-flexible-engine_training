#Création des VPC

resource "flexibleengine_vpc_v1" "vpc_test_1" {
  name = "vpc_test_1_pour_peering"
  cidr = "192.168.0.0/16"
  tags = var.tag_Custom
}

resource "flexibleengine_vpc_v1" "vpc_test_2" {
  name = "vpc_test_2_pour_peering"
  cidr = "10.0.0.0/16"
  tags = var.tag_Custom
}

# Création des différents subnets

resource "flexibleengine_vpc_subnet_v1" "subnet_1" {
  name       = "subnet_1"
  vpc_id     = flexibleengine_vpc_v1.vpc_test_1.id
  cidr       = "192.168.0.0/24"
  gateway_ip = "192.168.0.1"
  tags       = var.tag_Custom
}

resource "flexibleengine_vpc_subnet_v1" "subnet_2" {
  name       = "subnet_2"
  vpc_id     = flexibleengine_vpc_v1.vpc_test_1.id
  cidr       = "192.168.1.0/24"
  gateway_ip = "192.168.1.1"
  tags       = var.tag_Custom
}

resource "flexibleengine_vpc_subnet_v1" "subnet_3" {
  name       = "subnet_3"
  vpc_id     = flexibleengine_vpc_v1.vpc_test_2.id
  cidr       = "10.0.0.0/24"
  gateway_ip = "10.0.0.1"
  tags       = var.tag_Custom
}

resource "flexibleengine_vpc_subnet_v1" "subnet_4" {
  name       = "subnet_2"
  vpc_id     = flexibleengine_vpc_v1.vpc_test_2.id
  cidr       = "10.0.1.0/24"
  gateway_ip = "10.0.1.1"
  tags       = var.tag_Custom
}

#Création d'EIP

resource "flexibleengine_vpc_eip_v1" "eip_SNAT" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name       = "bandwidth_test_OUT"
    size       = 1
    share_type = "PER"
  }

  tags = var.tag_Custom

}

resource "flexibleengine_vpc_eip_v1" "eip_DNAT" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name       = "bandwidth_test_IN"
    size       = 1
    share_type = "PER"
  }

  tags = var.tag_Custom

}

# example of a security group (without any rules in it)
resource "flexibleengine_networking_secgroup_v2" "secgroup_test" {
  name        = "secgroup_test"
  description = "a test security group created throught terraform"
}

# création d'un VPC peering
resource "flexibleengine_vpc_peering_connection_v2" "peering_test" {
  name        = "peering_test"
  vpc_id      = flexibleengine_vpc_v1.vpc_test_1.id
  peer_vpc_id = flexibleengine_vpc_v1.vpc_test_2.id
}