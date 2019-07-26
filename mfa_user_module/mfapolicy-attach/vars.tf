variable "users"{
  type = list(string)
  default = ["hema1","hema2"]
}

variable "role"{
  type = string
  default = "engineer"
}


variable "mfapolicy-arn"{
  type = string
}

variable "engineerpolicy-arn"{
  type = string
}

variable "adminpolicy-arn"{
  type = string
}
