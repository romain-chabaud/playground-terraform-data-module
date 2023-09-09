variable "secret_configuration" {
  type = object({
    name     = string
    location = string
    values    = map(string)
  })
  sensitive = true
  nullable  = false
}