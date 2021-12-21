output "username" {
  value = var.USERNAME
}
output "DOMAIN_NAME" {
  value = var.DOMAIN_NAME
}
output "VPC_ID" {
  value = flexibleengine_vpc_v1.vpc_test.id
}
output "SUBNET_ID-1" {
  value = flexibleengine_vpc_subnet_v1.subnet_1.id
}
output "SUBNET-ID-2" {
  value = flexibleengine_vpc_subnet_v1.subnet_2.id
}

