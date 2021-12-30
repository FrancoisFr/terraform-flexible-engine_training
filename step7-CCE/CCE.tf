resource "flexibleengine_cce_cluster_v3" "clustertest" {
  name                   = "clustertest"
  cluster_type           = "VirtualMachine"
  authentication_mode    = "rbac"
  description            = "new cluster test"
  flavor_id              = var.cluster_flavor
  vpc_id                 = flexibleengine_vpc_v1.vpc_test_cce.id
  subnet_id              = flexibleengine_vpc_subnet_v1.subnet_cce.id
  container_network_type = "overlay_l2"
}

resource "flexibleengine_cce_node_v3" "node_1" {
  depends_on = [
    flexibleengine_vpc_eip_v1.eip_node1
  ]
  cluster_id        = flexibleengine_cce_cluster_v3.clustertest.id
  name              = "node1"
  flavor_id         = var.flavor
  availability_zone = var.availability_zone
  key_pair          = var.ssh_key
  iptype            = "5_bgp"
  sharetype         = "PER"
  bandwidth_size    = 100
  os                = "CentOS 7.7"
  postinstall = "scripts/common.sh"

  root_volume {
    size       = 40
    volumetype = "SATA"
  }
  data_volumes {
    size       = 100
    volumetype = "SATA"
  }

  tags = var.tag_Custom
  
  timeouts {
    create = "60m"
    delete = "2h"
  }
}
