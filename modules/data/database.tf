resource "random_password" "random_database_password" {
  length = var.desired_password_length >= var.min_password_length ? var.desired_password_length : var.min_password_length
}

resource "google_sql_database" "database" {
  name     = var.database_configuration.name
  instance = var.database_configuration.instance
}

resource "google_sql_user" "user" {
  name     = var.database_configuration.username
  instance = var.database_configuration.instance
  password = random_password.random_database_password.result
}