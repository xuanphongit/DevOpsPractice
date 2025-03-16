variable "resource_group_name" {}
variable "location" {}
variable "subnet_id" {}
variable "sql_admin_password" {
  type      = string
  sensitive = true
}