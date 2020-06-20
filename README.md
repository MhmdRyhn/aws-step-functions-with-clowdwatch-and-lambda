# aws-step-functions-with-clowdwatch-and-lambda
Triggering AWS Step Functions from CloudWatch to execute a series of Lambda Functions.


# Commands To Manipulate Resources
- Installs required terraform plugins. See more details 
[**here**](https://www.terraform.io/docs/commands/init.html)
```
terraform init
```
- **View execution plan**
```
terraform plan --var-file input.tfvars
```

- **Apply the configurations** 
```
terraform apply --var-file input.tfvars --auto-approve
```
Remove `--auto-approve` option from the above command to approve manually (by inputting prompt).

- **Destroy all resources**
```
terraform destroy --var-file input.tfvars --auto-approve
```
Remove `--auto-approve` option from the above command to approve manually (by inputting prompt).

