variable "variable_string" {
  description = "meaningful description of the variable"
  type        = string
  default     = "aniket"
}
# If no default value is provided then the variable is optional

variable "variable_number" {
  description = "sensitive flag prevents it from displaying during deployment"
  type        = number
  sensitive   = true
  default     = 2
}

variable "variable_boolean" {
  description = "meaningful description of the variable"
  type        = bool
  default     = "true"
}

variable "variable_list" {
  description = "meaningful description of the variable"
  type        = list(string)
  default     = ["aniket", "prashar"]
}

variable "variable_map" {
  description = "meaningful description of the variable"
  type        = map(string)
  default = {
    key1 = "value1",
    key2 = "value2"
  }
}

variable "variable_object" {
  description = "meaningful description of the variable"
  type = object({
    location           = string
    varsioning_enabled = bool
    tags               = optional(map(string))
    names              = list(string)
    identity_list      = map(object({ name = string, resource_group = string }))
    configurations     = optional(object({ location = string, names = list(string) }))
  })
  default = {
    location           = "eastus2"
    varsioning_enabled = true
    tags               = null
    names              = ["Aniket"]
    identity_list = {
      "one" = {
        name           = "Aniket",
        resource_group = "AniketRG"
      }
    }
    configurations = {
      location = "eastus2",
      names    = ["Aniket"]
    }
  }
}
# in objects, comma is optional
