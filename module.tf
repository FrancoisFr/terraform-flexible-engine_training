module "ecs" {
  source = "FlexibleEngineCloud/ecs/flexibleengine"

  instance_name  = "my-cluster"
  instance_count = 2
  availability_zone = "eu-west-0a"

  flavor_name        = "t2.small"
  key_name           = "my-key"
  security_groups    = ["sg-group-id-1","sg-group-id-2"]
  subnet_id          = "my-subnet-id"
  network_id         = "my-network-id"

  new_eip = false

  dns_record  = true
  domain_id   = "my-domain-id"
  domain_name = "my-domain-name"

  block_devices = [
    {
      uuid = "<ImageID>"
      source_type = "image"
      destination_type = "volume"
      volume_size = 50
      boot_index = 0
      delete_on_termination = true
      volume_type = "SATA" #SATA/SSD
    }
  ]
}
