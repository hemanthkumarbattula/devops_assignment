resource "aws_iam_user_policy_attachment" "MFAEnforcing" {
  count      =  length(var.users)
  user       =  "${var.users[count.index]}"
  policy_arn = "${var.mfapolicy-arn}"
}

resource "aws_iam_user_policy_attachment" "access" {
  count      =  length(var.users)
  user       =  "${var.users[count.index]}"
  policy_arn = "${ var.role == "admin" ?  var.adminpolicy-arn:var.engineerpolicy-arn}"
}
