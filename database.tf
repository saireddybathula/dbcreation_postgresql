# Create a Cloud SQL database instance
resource "google_sql_database_instance" "postgres_instance" {
  name         = "my-postgres-instance"
  database_version = "POSTGRES_14"  # Choose your desired version
  settings {
    tier = "db-f1-micro"  # Adjust tier based on your needs
    activation_policy = "ALWAYS"
  }
}

# Create a user for the database (optional)
resource "google_sql_user" "postgres_user" {
  name     = "saireddybathula"
  instance = google_sql_database_instance.postgres_instance.name
  password = "Laptop@#123"  # Replace with a strong password
}

# Create a database (optional)
resource "google_sql_database" "my_database" {
  name     = "gcpposstgresql"
  instance = google_sql_database_instance.postgres_instance.name
}

// Printing out the instance connection name to be used in connection strings
output "instance_connection_name" {
  value = google_sql_database_instance.postgres_instance.connection_name
}
