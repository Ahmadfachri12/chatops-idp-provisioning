#######################################
# Environment Name
#######################################
variable "env_name" {
  description = "Nama environment (dev, staging, prod)"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.env_name)
    error_message = "env_name harus salah satu dari: dev, staging, prod."
  }
}
