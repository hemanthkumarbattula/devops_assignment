provider "aws" {
  region     = "XXXXXXXXXXX"
  access_key = "XXXXXXXX"
  secret_key = "XXXXXXXX"
}

module "mfapolicies"{
   source = "./mfapolicies"
}

module "engineer_users"{
   source = "./mfapolicy-attach"
   users = ["alice","bea"]
   role = "engineers"
   mfapolicy-arn = "${module.mfapolicies.MFAAccessIfMFADisabled}"
   engineerpolicy-arn = "${module.mfapolicies.EngineerAccessIfMFAEnabled}"
   adminpolicy-arn = "${module.mfapolicies.AdminAccessIfMFAEnabled}"
}

module "admin_users"{
   source = "./mfapolicy-attach"
   users = ["bofh"]
   role = "admin"
   mfapolicy-arn = "${module.mfapolicies.MFAAccessIfMFADisabled}"
   engineerpolicy-arn = "${module.mfapolicies.EngineerAccessIfMFAEnabled}"
   adminpolicy-arn = "${module.mfapolicies.AdminAccessIfMFAEnabled}"
}
