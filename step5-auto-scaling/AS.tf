#Configuration de l'auto-scaling
resource "flexibleengine_as_configuration_v1" "as_config_test" {
  scaling_configuration_name = "as_conf_test"
  instance_config {
    instance_id = flexibleengine_compute_instance_v2.instance.id
    key_name    = "key-as"
  }
}

#groupe d'auto-scaling
resource "flexibleengine_as_group_v1" "as_group_test" {
  scaling_group_name       = "as_group_test"
  desire_instance_number   = 2
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

#Mise en place d'alarme CLoud Eye pour le CPU usage

resource "flexibleengine_ces_alarmrule" "alarm_rule" {
  alarm_name = "alarm_rule"

  metric {
    namespace   = "SYS.AS"
    metric_name = "cpu_util"
    dimensions {
      name  = "instance_id"
      value = flexibleengine_as_group_v1.as_group_test.id
    }
  }
  condition {
    period              = 300
    filter              = "average"
    comparison_operator = ">"
    value               = 70
    unit                = "%"
    count               = 1
  }
  alarm_actions {
    type              = "autoscaling"
    notification_list = []
  }
}



resource "flexibleengine_ces_alarmrule" "alarm_rule2" {
  alarm_name = "alarm_rule"

  metric {
    namespace   = "SYS.AS"
    metric_name = "cpu_util"
    dimensions {
      name  = "instance_id"
      value = flexibleengine_as_group_v1.as_group_test.id
    }
  }
  condition {
    period              = 300
    filter              = "average"
    comparison_operator = "<"
    value               = 30
    unit                = "%"
    count               = 1
  }
  alarm_actions {
    type              = "autoscaling"
    notification_list = []
  }
}

#AS policy to scale up if the cpu usage is too high
resource "flexibleengine_as_policy_v1" "test_cpu_policy" {
  scaling_policy_name = "test_cpu_policy"
  scaling_group_id    = flexibleengine_as_group_v1.as_group_test.id
  cool_down_time      = 900
  scaling_policy_type = "ALARM"
  alarm_id            = flexibleengine_ces_alarmrule.alarm_rule.id
  scaling_policy_action {
    operation       = "ADD"
    instance_number = 1
  }
}

#AS policy to scale down if the cpu usage is low enough
resource "flexibleengine_as_policy_v1" "test_cpu_policy_scale_down" {
  scaling_policy_name = "test_cpu_policy"
  scaling_group_id    = flexibleengine_as_group_v1.as_group_test.id
  cool_down_time      = 900
  scaling_policy_type = "ALARM"
  alarm_id            = flexibleengine_ces_alarmrule.alarm_rule.id
  scaling_policy_action {
    operation       = "REMOVE"
    instance_number = 1
  }
}
