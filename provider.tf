terraform {
  required_version = ">= 0.13"

  required_providers {
    flexibleengine = {
      source = "FlexibleEngineCloud/flexibleengine"
      version = ">= 1.20.0"
    }
  }
}

#provider "flexibleengine" {
#    access_key = var.FLEXIBLE_ENGINE_ACCESS_KEY
#    secret_key = var.FLEXIBLE_ENGINE_SECRET_KEY
#    domain_name = var.DOMAIN_NAME
#    region = "eu-west-0"
#}
