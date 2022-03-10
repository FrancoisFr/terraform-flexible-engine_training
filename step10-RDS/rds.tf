# création d'un bucket via terraform

resource "flexibleengine_rds_instance_v3" "instance" {
  name              = "terraform_test_rds_instance"
  flavor            = "rds.pg.s1.medium"
  availability_zone = var.availability_zone
  security_group_id = var.sec_group_id
  vpc_id            = var.vpc_id
  subnet_id         = var.subnet_id

  db {
    type     = "PostgreSQL"
    version  = "12.6"
    password = var.db_password
    port     = "8635"
  }
  volume {
    type = "COMMON"
    size = 100
  }
  backup_strategy {
    start_time = "08:00-09:00"
    keep_days  = 1
  }
}