output "database_configuration" {
  value = {
    instance_name = data.google_sql_database_instance.database_instance.name
    public_ip     = data.google_sql_database_instance.database_instance.public_ip_address
    port          = 5432
    database_name = google_sql_database.database.name
    username      = google_sql_user.user.name
    password      = google_sql_user.user.password
  }
}