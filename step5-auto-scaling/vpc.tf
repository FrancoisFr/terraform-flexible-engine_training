#Création d'un VPC

resource "flexibleengine_vpc_v1" "vpc_test" {
  name = "vpc_test_via_terraform-francois"
  cidr = "192.168.0.0/16"
  tags = var.tag_Custom
}

# Création des différents subnets

resource "flexibleengine_vpc_subnet_v1" "subnet_public" {
  name       = "subnet_public"
  vpc_id     = flexibleengine_vpc_v1.vpc_test.id
  cidr       = "192.168.0.0/24"
  gateway_ip = "192.168.0.1"
  tags       = var.tag_Custom
}

resource "flexibleengine_vpc_subnet_v1" "subnet_private" {
  name       = "subnet_private"
  vpc_id     = flexibleengine_vpc_v1.vpc_test.id
  cidr       = "192.168.1.0/24"
  gateway_ip = "192.168.1.1"
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


resource "flexibleengine_networking_secgroup_v2" "secgroup_test" {
  name        = "secgroup_test"
  description = "a test security group created throught terraform"
}
