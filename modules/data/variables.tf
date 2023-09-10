variable "database_configuration" {
  type = object({
    instance = object({
      name                = string
      exists              = bool
      authorized_networks = optional(string, "0.0.0.0/0")
    })
    database_name = string
    user_name     = string
    password_generation = object({
      desired_password_length = number
      min_password_length     = optional(number, 8)
    })
  })
}