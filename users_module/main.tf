resource "aws_iam_user" "users"{
 count = length(var.admin_users)
 name = var.admin_users[count.index]
}

resource "aws_iam_group" "group"{
 name = "${var.group}"
}

resource "aws_iam_group_membership" "group_membership"{
  name = "admin-group-membership"
  users = "${aws_iam_user.users.*.name}"
  group = "${aws_iam_group.group.name}"
  depends_on = ["aws_iam_group.group"]
}

data "aws_iam_policy_document" "admin_policy_document" {
  statement {
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "engineers_policy_document" {
  statement {
    effect    = "Allow"
    actions   =  ["ec2:*","s3:*"]
    resources = ["*"]
  }
}


resource "aws_iam_group_policy" "admin_policy" {
  name  = "${ var.group == "admin" ? "admin_policy" : "engineer_policy"}"
  group = "${aws_iam_group.group.name}"
#  policy = data.aws_iam_policy_document."{$var.group}"_policy_document.json
  policy = "${ var.group == "admin" ? data.aws_iam_policy_document.admin_policy_document.json : data.aws_iam_policy_document.engineers_policy_document.json}"
  depends_on = ["aws_iam_group.group"]
}



resource "aws_iam_account_password_policy" "strict" {
  allow_users_to_change_password = true
}

resource "aws_iam_user_login_profile" "admin_user_profile" {
  count	= length(var.admin_users)
  user	= "${aws_iam_user.users[count.index].name}"
  password_reset_required	= true
  pgp_key	= "keybase:hemanth"
}
