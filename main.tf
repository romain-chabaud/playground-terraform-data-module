module "data_provisioning" {
  source = "./modules/data"
  database_configuration = {
    instance = {
      name                = var.database_configuration.instance.name
      exists              = var.database_configuration.instance.exists
      authorized_networks = var.database_configuration.instance.authorized_networks
    }
    database_name = var.database_configuration.database_name ? var.database_configuration.database_name : "${var.app_name}_database"
    user_name     = var.database_configuration.user_name ? var.database_configuration.user_name : "${var.app_name}_database_user"
    password_generation = {
      desired_password_length = var.database_configuration.password_generation.desired_password_length
      min_password_length     = var.database_configuration.password_generation.min_password_length
    }
  }
}

module "secret_provisioning" {
  source = "./modules/secret"
  secret_configuration = {
    name     = "${var.app_name}_database_configuration_secret"
    location = var.app_region
    value    = jsonencode(module.data_provisioning.database_configuration)
  }
}