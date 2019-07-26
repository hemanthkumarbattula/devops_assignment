# devops_assignment

There are two folders in this git each is used for different tasks.


users_module:

This module  is used for creating admin users with all the permissions and engineer users with only the permissions to the EC2 , S3 along with the permissions to change his own password. This module takes two inputs list of the users and the role which they belongs to. There is a file "users.tf" which can be used to call the module.

Example run: terraform apply users.tf

mfa_user_module:
This module is used to enforce the MFA onto the users which are already present in the AWS account. this module contains 2 sub modules "mfapolicies", to create the policies depending on the role of the user and "mfapolicy-attach", for attaching the policies to the respective users based on the role assigned to them. The file "mfaenforce.tf", can be used as a way to use the module. This module takes the list of users and role which has to be asigned to them.

example run: terraform apply mfaenforce.tf

Authentication to the AWS account:
==================================

In each of the files "users.tf","mfaenforce.tf" there is a section called as provider where one can provide credentials for the aws account.

Note: There are other ways of the authentication which can be used using the environment variales or shared credentials file or a AWS role, which can be updated tin the provider block respectively as needed.
