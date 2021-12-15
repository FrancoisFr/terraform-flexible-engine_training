resource "flexibleengine_cce_cluster_v3" "clustertest" {
  name                   = "clustertest"
  cluster_type           = "VirtualMachine"
  authentication_mode    = "rbac"
  description            = "new cluster test"
  flavor_id              = var.flavor
  vpc_id                 = flexibleengine_vpc_v1.vpc_test_cce.id
  subnet_id              = flexibleengine_vpc_subnet_v1.subnet_cce.id
  container_network_type = "overlay_l2"
}

resource "flexibleengine_cce_node_pool_v3" "node_pool" {
  cluster_id               = flexibleengine_cce_cluster_v3.clustertest.id
  name                     = "testpool"
  os                       = "CentOS 7.7"
  initial_node_count       = 2
  flavor_id                = var.flavor
  availability_zone        = var.availability_zone
  key_pair                 = var.ssh_key
  scall_enable             = true
  min_node_count           = 1
  max_node_count           = 10
  scale_down_cooldown_time = 100
  priority                 = 1
  type                     = "vm"

  root_volume {
    size       = 40
    volumetype = "SAS"
  }
  data_volumes {
    size       = 100
    volumetype = "SAS"
  }
}
