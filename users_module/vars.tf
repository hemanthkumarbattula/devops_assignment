variable "engineer_users" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["alice", "bea"]
}

variable "admin_users"{
  description = "List of users who should be part of admin group"
  type        = list(string)
  default     = ["bofu"]
}

variable "group"{
  description = "group_name"
  type        = string
}

