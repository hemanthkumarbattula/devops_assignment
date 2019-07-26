provider "aws" {
  region     = "xxxx"
  access_key = "xxxxxxxxxx"
  secret_key = "xxxxxxxxxxx"
}

module "engineer_users"{
   source = "../user-module"
   admin_users = ["alice","bea",]
   group = "engineers"
}

module "admin_users"{
   source = "../user-module"
   admin_users = ["bofh"]
   group = "admin"
}


output "engineer_user_pass"{
  value = "${module.engineer_users.users}"
}

output "admin_user_pass"{
  value = "${module.admin_users.users}"
}

