variable "database_configuration" {
  type = object({
    instance = string
    name     = string
    username = string
  })
  sensitive = true
  nullable  = false
}

variable "desired_password_length" {
  type = number
}

variable "min_password_length" {
  type    = number
  default = 8
}