resource "flexibleengine_cce_cluster_v3" "cluster_1" {
  name                   = "cluster_test"
  cluster_type           = "VirtualMachine"
  authentication_mode    = "rbac"
  description            = "new cluster test"
  flavor_id              = var.flavor
  vpc_id                 = flexibleengine_vpc_v1.vpc_test_cce.id
  subnet_id              = flexibleengine_vpc_subnet_v1.subnet_cce.id
  container_network_type = "overlay_l2"
  labels = var.tag_Custom
}
