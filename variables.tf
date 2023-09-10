variable "app_name" {
  type = string
}

variable "app_region" {
  type = string
}

variable "database_configuration" {
  type = object({
    instance = object({
      name                = string
      exists              = bool
      authorized_networks = optional(string)
    })
    database_name = optional(string)
    user_name     = optional(string)
    password_generation = optional(
      object({
        desired_password_length = optional(number)
        min_password_length     = optional(number)
      })
    )
  })
}