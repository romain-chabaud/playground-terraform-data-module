resource "google_sql_database_instance" "database_instance" {
  name             = var.database_configuration.instance.name
  database_version = "POSTGRES_14"
  settings {
    tier = "db-f1-micro"

    ip_configuration {
      authorized_networks {
        value = var.database_configuration.instance.authorized_networks
      }
    }
  }

  count = var.database_configuration.instance.exists ? 0 : 1
}

data "google_sql_database_instance" "database_instance" {
  name = var.database_configuration.instance.exists ? var.database_configuration.instance.name : google_sql_database_instance.database_instance[0].name
}

resource "random_password" "random_database_password" {
  length = var.database_configuration.password_generation.desired_password_length >= var.database_configuration.password_generation.min_password_length ? var.database_configuration.password_generation.desired_password_length : var.database_configuration.password_generation.min_password_length
}

resource "google_sql_database" "database" {
  name     = var.database_configuration.database_name
  instance = data.google_sql_database_instance.database_instance.name
}

resource "google_sql_user" "user" {
  name     = var.database_configuration.user_name
  instance = data.google_sql_database_instance.database_instance.name
  password = random_password.random_database_password.result
}