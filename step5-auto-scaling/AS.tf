#Configuration de l'auto-scaling
resource "flexibleengine_as_configuration_v1" "as_config_test" {
  scaling_configuration_name = "as_conf_test"
  instance_config {
    instance_id = flexibleengine_compute_instance_v2.instance.id
    key_name = "key-as"
  }
}

#groupe d'auto-scaling
resource "flexibleengine_as_group_v1" "as_group_test" {
  scaling_group_name       = "as_group_test"
  desire_instance_number   = 10
  min_instance_number      = 0
  max_instance_number      = 10
  scaling_configuration_id = flexibleengine_as_configuration_v1.as_config_test.id
  vpc_id                   = flexibleengine_vpc_v1.vpc_test.id
  delete_publicip          = true
  delete_instances         = "yes"

  networks {
    id = flexibleengine_vpc_subnet_v1.subnet_public.id
  }
  security_groups {
    id = flexibleengine_networking_secgroup_v2.secgroup_test.id
  }
}

#Mise en place d'alarme CLoud Eye
